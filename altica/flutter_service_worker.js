'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "index.html": "a124bb9fcbff10e7cdce13375b57db99",
"/": "a124bb9fcbff10e7cdce13375b57db99",
"main.dart.js": "03f8f9f8d6a109a93291572d3c6ebb2d",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "4d6d8d00ee69b8d512b795341a2440ef",
"assets/LICENSE": "91750473e3cf314448ffd3bf3ae1975d",
"assets/AssetManifest.json": "fdcef8199482c65baa09b45c10f24ae5",
"assets/FontManifest.json": "01700ba55b08a6141f33e168c4a6c22f",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/packages/flutter_markdown/assets/logo.png": "67642a0b80f3d50277c44cde8f450e50",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/assets/posts/post_1.md": "ab831344c405c92d8961f7298274b5d1",
"assets/assets/posts/post_3.md": "ab831344c405c92d8961f7298274b5d1",
"assets/assets/posts/post_2.md": "ab831344c405c92d8961f7298274b5d1"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
