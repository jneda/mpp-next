import { NextResponse } from "next/server";
import { getIronSession } from "iron-session/edge";
import { sessionOptions } from "./session/sessionConfig";

const userRoutes = ["/homepage", "/diary", "/editor", "/favorites"];

export async function middleware(req) {
  const res = NextResponse.next();

  if (userRoutes.includes(req.nextUrl.pathname)) {
    console.log("[middleware] requesting a user route");

    const session = await getIronSession(req, res, sessionOptions);
    const { user } = session;
    // console.log("[middleware] user:", user);
    if (!user) {
      console.log("[middleware] unauthenticated user:", user);
      const url = req.nextUrl.clone();
      url.pathname = "/quotes";
      return NextResponse.redirect(url);
    }
  }

  return res;
}
export const config = {
  matcher: ["/homepage", "/diary", "/editor", "/favorites"],
};
