// キャッシュファイルの指定
let CACHE_NAME = 'caches';
let urlsToCache = [
    '.',
];

// インストール処理
self.addEventListener('install', (event) => {
    event.waitUntil(
        caches
            .open(CACHE_NAME)
            .then((cache) => {
                return cache.addAll(urlsToCache);
            })
    );
});

// リソースフェッチ時のキャッシュロード処理
self.addEventListener('fetch', (event) => {
    event.respondWith(
        caches
            .match(event.request)
            .then((response) => {
                return response ? response : fetch(event.request);
            })
    );
});
