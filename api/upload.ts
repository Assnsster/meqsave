export default async function handler(req, res) {
  if (req.method !== "POST") {
    return res.status(405).end();
  }

  const ip =
    req.headers["x-forwarded-for"]?.split(",")[0] ||
    req.socket.remoteAddress;

  const body = req.body;

  const firebaseURL =
    "https://meqsave-default-rtdb.asia-southeast1.firebasedatabase.app/" +
    encodeURIComponent(ip) +
    ".json";

  await fetch(firebaseURL, {
    method: "PUT",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({
      data: body,
      time: Date.now()
    })
  });

  res.json({
    ok: true,
    ip: ip
  });
}
