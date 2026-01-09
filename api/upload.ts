export default async function handler(req, res) {
  if (req.method !== "POST") {
    return res.status(405).end();
  }

  const ip =
    req.headers["x-forwarded-for"]?.split(",")[0] ||
    req.socket.remoteAddress;

  const body = req.body;

  console.log("IP:", ip);
  console.log("DATA:", body);

  res.json({
    ok: true,
    ip: ip,
    received: body
  });
}
