import "@supabase/functions-js/edge-runtime.d.ts";
import { errorResponse, requireUser } from "../_shared/auth.ts";
import { syncRevenueCatSubscription } from "../_shared/revenuecat.ts";

Deno.serve(async (req) => {
  if (req.method !== "POST") {
    return Response.json({ success: false, message: "Method not allowed." }, {
      status: 405,
    });
  }

  try {
    const { admin, user } = await requireUser(req);
    const subscription = await syncRevenueCatSubscription(admin, user.id);
    return Response.json({ success: true, data: subscription });
  } catch (error) {
    return errorResponse(error);
  }
});
