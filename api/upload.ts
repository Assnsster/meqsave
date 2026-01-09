export const config = {
  api: {
    bodyParser: true,
  },
};

export default async function handler(req, res) {
  if (req.method !== "POST") {
    return res.status(405).json({ error: "Method not allowed" });
  }

  const ip =
    (req.headers["x-forwarded-for"] || "")
      .toString()
      .split(",")[0]
      .trim() ||
    req.socket.remoteAddress ||
    "unknown";

  const body = req.body;
  
  const firebaseURL =
    "https://meqsave-default-rtdb.asia-southeast1.firebasedatabase.app/logs/" +
    encodeURIComponent(ip) +
    ".json";

  await fetch(firebaseURL, {
    method: "PUT",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({
      data: body,
      updatedAt: Date.now(),
    }),
  });

  res.status(200).json({
    ok: true,
    ip,
  });
}
