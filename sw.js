self.addEventListener("install", () => self.skipWaiting());
self.addEventListener("activate", event => {
  event.waitUntil((async () => {
    try {
      for (const k of await caches.keys()) await caches.delete(k);
    } catch {}
    try { await self.registration.unregister(); } catch {}
    try {
      const list = await self.clients.matchAll({ type: "window" });
      for (const c of list) c.navigate(c.url);
    } catch {}
  })());
});
// no fetch handler -> don’t intercept anything
