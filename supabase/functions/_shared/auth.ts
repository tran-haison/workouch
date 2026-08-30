import {
  createClient,
  type SupabaseClient,
  type User,
} from "npm:@supabase/supabase-js@2";

export type AuthContext = {
  admin: SupabaseClient;
  user: User;
};

export async function requireUser(req: Request): Promise<AuthContext> {
  const supabaseUrl = Deno.env.get("SUPABASE_URL");
  const publishableKey = Deno.env.get("SUPABASE_PUBLISHABLE_KEY") ??
    Deno.env.get("SUPABASE_ANON_KEY");
  const secretKey = Deno.env.get("SUPABASE_SECRET_KEY") ??
    Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
  const authorization = req.headers.get("Authorization");

  if (!supabaseUrl || !publishableKey || !secretKey) {
    throw new HttpError(500, "The function is missing Supabase configuration.");
  }
  if (!authorization?.startsWith("Bearer ")) {
    throw new HttpError(401, "Authentication is required.");
  }

  const userClient = createClient(supabaseUrl, publishableKey, {
    global: { headers: { Authorization: authorization } },
    auth: { persistSession: false, autoRefreshToken: false },
  });
  const { data, error } = await userClient.auth.getUser();
  if (error || !data.user) {
    throw new HttpError(401, "The access token is invalid or expired.");
  }

  return {
    user: data.user,
    admin: createClient(supabaseUrl, secretKey, {
      auth: { persistSession: false, autoRefreshToken: false },
    }),
  };
}

export class HttpError extends Error {
  constructor(public readonly status: number, message: string) {
    super(message);
  }
}

export function errorResponse(error: unknown): Response {
  const status = error instanceof HttpError ? error.status : 500;
  if (!(error instanceof HttpError)) console.error(error);
  const message = error instanceof HttpError
    ? error.message
    : "Unexpected server error.";
  return Response.json({ success: false, message }, { status });
}
