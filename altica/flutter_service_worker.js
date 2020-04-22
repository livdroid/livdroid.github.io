'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "favicon.ico": "69375a1198dbbace450a28f2c70ec684",
"index.html": "46b4e84f1f073898df5570b77c5c76e8",
"/": "46b4e84f1f073898df5570b77c5c76e8",
"main.dart.js": "64ff9dc28b77340f7368ecfc049cb6d3",
"assets/LICENSE": "5a593886a333db20de44ff374be4cb21",
"assets/AssetManifest.json": "baf6e0e26a217680939895575be6e25e",
"assets/FontManifest.json": "0edc3beed02397717062f013caae55ac",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/icon/outline_star_border_black_24dp.png": "02de655de81ee185078c5dbac0c28e18",
"assets/icon/outline_star_black_24dp.png": "8c43e44440052afea9f0d433c7f4b4db",
"assets/icon/delete.png": "b0879b0bcc364197dc4dff5f4e838c63",
"assets/icon/outline_star_border_white_24dp.png": "63f1be9b6d7d6b129fc4aa20fa9dfde2",
"assets/icon/delete-white.png": "088f07ae5c4538c16983852bef54c2e9",
"assets/icon/outline_star_white_24dp.png": "b5fb02fd11716e3d7c352164b74b5711",
"assets/assets/logo_altica.png": "7d0111f72f8213c6f5baf3f5315242ee",
"assets/assets/icon/outline_star_border_black_24dp.png": "02de655de81ee185078c5dbac0c28e18",
"assets/assets/icon/outline_star_black_24dp.png": "8c43e44440052afea9f0d433c7f4b4db",
"assets/assets/icon/delete.png": "b0879b0bcc364197dc4dff5f4e838c63",
"assets/assets/icon/outline_star_border_white_24dp.png": "63f1be9b6d7d6b129fc4aa20fa9dfde2",
"assets/assets/icon/delete-white.png": "088f07ae5c4538c16983852bef54c2e9",
"assets/assets/icon/outline_star_white_24dp.png": "b5fb02fd11716e3d7c352164b74b5711"
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
