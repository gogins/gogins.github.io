// cloud-5 static site: retire any previously installed PWA service worker.
self.addEventListener("install", () => self.skipWaiting());
self.addEventListener("activate", (event) => {
  event.waitUntil((async () => {
    try {
      for (const key of await caches.keys()) await caches.delete(key);
    } catch {}
    try {
      await self.registration.unregister();
    } catch {}
    try {
      const clients = await self.clients.matchAll({ type: "window" });
      for (const client of clients) client.navigate(client.url);
    } catch {}
  })());
});
