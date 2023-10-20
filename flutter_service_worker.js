'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "672b4ea3058316777f61b78c46bb264e",
"index.html": "de1dfc386025e11cc249a27397fd2bce",
"/": "de1dfc386025e11cc249a27397fd2bce",
"main.dart.js": "5e313fb03d00e50cca697bdaf25a36c4",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "c30f0a494ce8cc4475b6bb511e05bdcb",
"assets/AssetManifest.json": "db6e49ae99b67f41b25c3cede86ab687",
"assets/NOTICES": "f7659cc8a20bb0d4f4a5090b972a5309",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/tarot/TAROT42.jpeg": "3e4046a5bec982dc72838a0af9eeade0",
"assets/tarot/TAROT15.jpeg": "98e64915a869d65d47df319a8015f157",
"assets/tarot/TAROT03.jpeg": "021250cd2a1bd2685e1a768b7e9918d3",
"assets/tarot/TAROT39.jpeg": "7a3d4189c430ea33da8f1d673660777b",
"assets/tarot/TAROT020.jpeg": "f7aec8e16d068031fb34ff8aa6efaba8",
"assets/tarot/TAROT112.jpeg": "877987478676e1f04226e715d259cd29",
"assets/tarot/TAROT19.jpeg": "2702e0e059c644f62d6d6533ff675348",
"assets/tarot/TAROT016.jpeg": "bb31cef089f7f7d61990b8fdba251015",
"assets/tarot/TAROT411.jpeg": "2069703ec260d04e793b347fd3e84287",
"assets/tarot/TAROT313.jpeg": "4b741700d6b3705e9b5d8931403fb61f",
"assets/tarot/TAROT23.jpeg": "86722908158931450b7ad870f161b7ac",
"assets/tarot/TAROT35.jpeg": "1d129ec9f3c0ddffaf5dd763528b67b1",
"assets/tarot/TAROT34.jpeg": "72658dc247b225c50a71b2c98f8da35d",
"assets/tarot/TAROT312.jpeg": "ef631d148e7e18d99362169efb0e0531",
"assets/tarot/TAROT22.jpeg": "0d7b1711dba620d8ef1a2e19f7f9adcf",
"assets/tarot/TAROT410.jpeg": "00d7b8391d78234a903a6cfdda05ffa3",
"assets/tarot/TAROT017.jpeg": "68810d1e7e4d387fac1cf885c02cb29b",
"assets/tarot/TAROT18.jpeg": "340149cbfd5b2cfbfc8ae32355f0104e",
"assets/tarot/TAROT113.jpeg": "fc6584da7c3beb9def22c865c0249034",
"assets/tarot/TAROT021.jpeg": "514786c0606297df78c8ab40cb4d99e3",
"assets/tarot/TAROT38.jpeg": "824cc14a8a51a49b97a92a534167f178",
"assets/tarot/TAROT02.jpeg": "3b2902dc091b81478519a1b32bfb76ed",
"assets/tarot/TAROT14.jpeg": "7aa14dc3faa109a1ef9c9be527386806",
"assets/tarot/TAROT43.jpeg": "ba3a720987a8d833553dd330420d3595",
"assets/tarot/TAROT114.jpeg": "92a84f458edb4b56a640662b5986ee7c",
"assets/tarot/TAROT48.jpeg": "1b3880ba006bdfca419965841b4bd13a",
"assets/tarot/TAROT010.jpeg": "7bdd399665dd6ac165780460e3a9e850",
"assets/tarot/TAROT09.jpeg": "e161e1f69d32cd55cfb91c3279b947e0",
"assets/tarot/TAROT25.jpeg": "4d4a045c22aead832738e1b408407ebc",
"assets/tarot/TAROT211.jpeg": "4fc36594426b667dbe61d90c97b26aa8",
"assets/tarot/TAROT33.jpeg": "81cc11f9119787ac96aec769591e72d0",
"assets/tarot/TAROT44.jpeg": "e80c18159330b5d45024e12d21053e5f",
"assets/tarot/TAROT13.jpeg": "29ce1f3c088c7fafafa2aa8cd8762ff1",
"assets/tarot/TAROT05.jpeg": "ea40487783693580f13c87d056e7d99a",
"assets/tarot/TAROT29.jpeg": "5cdff891d25681c1d4e1b79a5959dabd",
"assets/tarot/TAROT28.jpeg": "e0ac622d0a3de235f9ea3606160f69c3",
"assets/tarot/TAROT04.jpeg": "7095f0de17cf23bea98094be7f1dd272",
"assets/tarot/TAROT12.jpeg": "cba01fadd3ef5ba75443a3ee36f178b6",
"assets/tarot/TAROT45.jpeg": "a8a969743a8e589df323147983b38c9b",
"assets/tarot/TAROT32.jpeg": "63462818fd9ffbb4f983d530574898ec",
"assets/tarot/TAROT210.jpeg": "59d1342c8b3e89efd248685293e28d2d",
"assets/tarot/TAROT314.jpeg": "339a5f07b1ca8d376a6bbbcb0031792f",
"assets/tarot/TAROT24.jpeg": "0cc6cd05d93a1f10f6fa0fb569e9bded",
"assets/tarot/TAROT08.jpeg": "cd4e1cf8dd58b75e966e04afd0111b36",
"assets/tarot/TAROT011.jpeg": "ebff9f8b87bf552e35ade8a25b5dfe3d",
"assets/tarot/TAROT49.jpeg": "73dd8b7f64de67a0089c420d84f85d93",
"assets/tarot/TAROT31.jpeg": "efd160807e1b58fa01bb809ef53b4347",
"assets/tarot/TAROT213.jpeg": "5f7162c90e1b3c244eeac48083c950da",
"assets/tarot/TAROT27.jpeg": "69c85ec8dfd1ee7179309788489631da",
"assets/tarot/TAROT012.jpeg": "ed51a27199dfeef3c3816cb0bbe00b99",
"assets/tarot/TAROT07.jpeg": "facaa7fb8c53248d39925233d310ea07",
"assets/tarot/TAROT11.jpeg": "e6bd6c28fae45dd35de08008bfba3536",
"assets/tarot/TAROT46.jpeg": "e858b611c30fd2472f46c8bb17e7ed4e",
"assets/tarot/TAROT47.jpeg": "8a6aae728dc5179f687c141f52d9c592",
"assets/tarot/TAROT06.jpeg": "7c5edd8ecd99da9c66b84a9737a4c3e1",
"assets/tarot/TAROT013.jpeg": "4cf8c3c71329897145f9cbd408fa640f",
"assets/tarot/TAROT414.jpeg": "308015271cb3b14cc4086e8fa0a33e8e",
"assets/tarot/TAROT26.jpeg": "404983591df3861669a2bb0d199d9b67",
"assets/tarot/TAROT212.jpeg": "dbff6421a43ec2a540a67a375cc7d121",
"assets/tarot/TAROT022.jpeg": "e162b71cfc26e5fffa0c3611b9939827",
"assets/tarot/TAROT018.jpeg": "b80230ca8e5239522673dd263654ef0e",
"assets/tarot/TAROT01.jpeg": "90c9046079c5e8b70bfed2befad5463a",
"assets/tarot/TAROT17.jpeg": "fd70cdda4c13d00aa0dddd8771636de3",
"assets/tarot/TAROT37.jpeg": "1ac587e366deff71e8699b30ee628405",
"assets/tarot/TAROT311.jpeg": "accb69cd442ff3fb824c9a6f8856121b",
"assets/tarot/TAROT21.jpeg": "34499bfde1b0c6a0619ff2d7a19a789c",
"assets/tarot/TAROT413.jpeg": "5e95cd05323f03241c178b401b1483d1",
"assets/tarot/TAROT014.jpeg": "6c0b36ba308862be19201ec0ab3054b8",
"assets/tarot/TAROT110.jpeg": "fcfdc5c5a681c8b3769fe2fded25c3c2",
"assets/tarot/TAROT111.jpeg": "46f0c4c1b5bfcd6555e6a7f207b3ed6b",
"assets/tarot/TAROT015.jpeg": "e83f389811ecf793f71f5c734245e500",
"assets/tarot/TAROT412.jpeg": "0cf7c9f62eb7df0cda5361e49b0b09b3",
"assets/tarot/TAROT310.jpeg": "3d4aaf1aa66745de1453801753daa5df",
"assets/tarot/TAROT214.jpeg": "b7be5b14be629e5b6df20fa7f046000f",
"assets/tarot/TAROT36.jpeg": "a979057779116c33b00fc51283443a42",
"assets/tarot/TAROT41.jpeg": "af4cfae8f289948159e9e8d86256d636",
"assets/tarot/TAROT16.jpeg": "d8711b5794c8b395fcfc8041a2761640",
"assets/tarot/TAROT00.jpeg": "8ed0fd5637cb3f54ccf1f01fd6dacfe7",
"assets/tarot/TAROT019.jpeg": "0d57389434ef8fd48cac9517c3ca92eb",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.bin": "dd225f44161da1db83e55d0f8de00388",
"assets/fonts/MaterialIcons-Regular.otf": "c62e675e897d82a21547b96e90451c8c",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "d1fde2560be92c0b07ad9cf9acb10d05",
"canvaskit/chromium/canvaskit.js": "96ae916cd2d1b7320fff853ee22aebb0",
"canvaskit/chromium/canvaskit.wasm": "1165572f59d51e963a5bf9bdda61e39b",
"canvaskit/canvaskit.js": "bbf39143dfd758d8d847453b120c8ebb",
"canvaskit/canvaskit.wasm": "19d8b35640d13140fe4e6f3b8d450f04",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
