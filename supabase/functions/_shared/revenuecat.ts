import type { SupabaseClient } from "npm:@supabase/supabase-js@2";
import { HttpError } from "./auth.ts";

type SubscriptionTier = "basic" | "proMonthly" | "proYearly" | "proLifetime";

type RevenueCatEntitlement = {
  expires_date?: string | null;
  product_identifier?: string | null;
};

type RevenueCatSubscriberResponse = {
  subscriber?: {
    entitlements?: Record<string, RevenueCatEntitlement>;
  };
};

const productTiers: Record<string, SubscriptionTier> = {
  workouch_pro_monthly: "proMonthly",
  "workouch_pro:workouch-pro-monthly": "proMonthly",
  workouch_pro_yearly: "proYearly",
  "workouch_pro:workouch-pro-yearly": "proYearly",
  workouch_pro_lifetime: "proLifetime",
};

function activeTier(payload: RevenueCatSubscriberResponse): SubscriptionTier {
  const now = Date.now();
  const entitlements = Object.values(payload.subscriber?.entitlements ?? {});

  for (const entitlement of entitlements) {
    const productId = entitlement.product_identifier ?? "";
    const tier = productTiers[productId];
    const expiry = entitlement.expires_date;
    if (tier && (!expiry || Date.parse(expiry) > now)) return tier;
  }
  return "basic";
}

export async function syncRevenueCatSubscription(
  admin: SupabaseClient,
  userId: string,
): Promise<Record<string, unknown>> {
  const apiKey = Deno.env.get("REVENUECAT_SECRET_API_KEY");
  if (!apiKey) {
    throw new HttpError(
      500,
      "RevenueCat server credentials are not configured.",
    );
  }

  const response = await fetch(
    `https://api.revenuecat.com/v1/subscribers/${encodeURIComponent(userId)}`,
    {
      headers: {
        Authorization: `Bearer ${apiKey}`,
        Accept: "application/json",
      },
    },
  );
  if (!response.ok) {
    throw new HttpError(
      503,
      "Could not verify the subscription with RevenueCat.",
    );
  }

  const tier = activeTier(
    await response.json() as RevenueCatSubscriberResponse,
  );
  const workoutGenLimit = tier === "basic" ? 1 : 50;

  const { data: existing, error: readError } = await admin
    .from("user_subscription")
    .select("subscription_tier")
    .eq("user_id", userId)
    .single();
  if (readError) {
    throw new HttpError(500, "Could not read the subscription record.");
  }

  const tierChanged = existing.subscription_tier !== tier;
  const subscriptionUpdate: Record<string, unknown> = {
    subscription_tier: tier,
    workout_gen_limit: workoutGenLimit,
  };
  if (tierChanged) {
    const periodStart = new Date();
    subscriptionUpdate.workout_gen_used = 0;
    subscriptionUpdate.period_start = periodStart.toISOString();
    subscriptionUpdate.period_end = new Date(
      periodStart.getTime() + 30 * 24 * 60 * 60 * 1000,
    ).toISOString();
  }

  const [
    { data: subscription, error: subscriptionError },
    { error: userError },
  ] = await Promise.all([
    admin.from("user_subscription").update(subscriptionUpdate).eq(
      "user_id",
      userId,
    ).select().single(),
    admin.from("users").update({ subscription_tier: tier }).eq("id", userId),
  ]);
  if (subscriptionError || userError) {
    throw new HttpError(500, "Could not persist the verified subscription.");
  }

  return subscription as Record<string, unknown>;
}
