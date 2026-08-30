import "@supabase/functions-js/edge-runtime.d.ts";
import { errorResponse, HttpError, requireUser } from "../_shared/auth.ts";
import { syncRevenueCatSubscription } from "../_shared/revenuecat.ts";

type RequestBody = {
  action?: "exercises" | "bodyparts" | "equipments" | "generateWorkout";
  query?: Record<string, string | number | null>;
  body?: Record<string, unknown>;
};

const routes = {
  exercises: { method: "GET", path: "/exercises/filter" },
  bodyparts: { method: "GET", path: "/bodyparts" },
  equipments: { method: "GET", path: "/equipments" },
  generateWorkout: { method: "POST", path: "/workouts/generate" },
} as const;

const exerciseQueryKeys = new Set([
  "limit",
  "offset",
  "sortBy",
  "sortOrder",
  "search",
  "equipments",
  "bodyParts",
]);

Deno.serve(async (req) => {
  if (req.method !== "POST") {
    return Response.json({ success: false, message: "Method not allowed." }, {
      status: 405,
    });
  }

  let userId: string | null = null;
  let generationReserved = false;
  let adminForRefund: Awaited<ReturnType<typeof requireUser>>["admin"] | null =
    null;

  try {
    const { admin, user } = await requireUser(req);
    userId = user.id;
    adminForRefund = admin;

    const request = await req.json() as RequestBody;
    const route = request.action ? routes[request.action] : undefined;
    if (!route) throw new HttpError(400, "Unknown exercise API action.");

    const queryEntries = Object.entries(request.query ?? {});
    if (
      queryEntries.length > 7 ||
      queryEntries.some(([key]) => !exerciseQueryKeys.has(key)) ||
      (request.action !== "exercises" && queryEntries.length > 0)
    ) {
      throw new HttpError(400, "Invalid exercise API query.");
    }

    if (request.action === "generateWorkout") {
      if (!request.body || JSON.stringify(request.body).length > 32_000) {
        throw new HttpError(
          400,
          "The workout request is missing or too large.",
        );
      }

      await syncRevenueCatSubscription(admin, user.id);
      const { error } = await admin.rpc("reserve_workout_generation", {
        p_user_id: user.id,
      });
      if (error?.message.includes("workout_generation_limit_reached")) {
        throw new HttpError(
          429,
          "You have reached your workout generation limit for this period.",
        );
      }
      if (error) {
        throw new HttpError(500, "Could not reserve a workout generation.");
      }
      generationReserved = true;
    }

    const upstreamBaseUrl = Deno.env.get("EXERCISE_API_BASE_URL") ??
      "https://api.vigorworkouch.com/api/v1";
    const upstreamKey = Deno.env.get("EXERCISE_DB_API_KEY");
    if (!upstreamKey) {
      throw new HttpError(500, "The exercise API is not configured.");
    }

    const url = new URL(`${upstreamBaseUrl}${route.path}`);
    for (const [key, value] of queryEntries) {
      if (value !== null && value !== "") {
        url.searchParams.set(key, String(value));
      }
    }

    const upstream = await fetch(url, {
      method: route.method,
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
        "x-api-key": upstreamKey,
      },
      body: route.method === "POST" ? JSON.stringify(request.body) : undefined,
      signal: AbortSignal.timeout(180_000),
    });
    const contentType = upstream.headers.get("content-type") ??
      "application/json";
    const responseBody = await upstream.text();

    if (!upstream.ok && generationReserved) {
      await admin.rpc("refund_workout_generation", { p_user_id: user.id });
      generationReserved = false;
    }

    return new Response(responseBody, {
      status: upstream.status,
      headers: { "Content-Type": contentType },
    });
  } catch (error) {
    if (generationReserved && userId && adminForRefund) {
      await adminForRefund.rpc("refund_workout_generation", {
        p_user_id: userId,
      });
    }
    return errorResponse(error);
  }
});
