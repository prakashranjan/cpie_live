var CACHE_NAME = 'static-cache_V1.04';
var urlsToCache = [
 
  'css/bootstrap.min.css',
  'css/commoncss.css',
  'css/dropzone.css',
  'css/freelancer.css',
  'css/homecss.css',
  'css/profilecss.css',
  'css/shoutbox.css',
  'css/styles.css',
  'css/topiccss.css',
  'css/typeahead.tagging.css',
  'css/typeahead.css',
  'css/bootstrap-tagsinput.css',
  'https://fonts.googleapis.com/css?family=Montserrat:400,700',
  'https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic',
  'https://fonts.googleapis.com/css?family=Ubuntu',
  'js/bootstrap.min.js',
  'js/bootstrap-tagsinput.js',
  'js/channel_1.js',
  'js/channel_2.js',
  'js/channel_common.js',
  'js/commonjs.js',
  'js/dropzone.js',
  'js/freelancer.js',
  'js/homejs.js',
  'js/logout.js',
  'js/scripts.js',
  'js/jquery.min.js',
  'js/jqBootstrapValidation.js',
  'js/jquery.easing.min.js',
  'js/private_topic_0.js',
  'js/private_topic_1.js',
  'js/private_topic_common.js',
  'js/profilemejs.js',
  'js/signupscript.js',
  'js/topicjs.js',
  'js/typeahead.tagging.js',
  'js/typeahead.js',
  'js/shoutbox.js',
  'https://cdnjs.cloudflare.com/ajax/libs/typeahead.js/0.10.4/typeahead.bundle.min.js',
  'js/classie.js',
  'js/cbpAnimatedHeader.js',
  'js/profileotherjs.js',
  'images/copy.gif',
  'images/sorry.png',
  'images/ppicdefm.png',
  'images/ppicdeff.jpg',
  'images/tt1.png',
  'images/tt2.png',
  'images/tt3.png',
  'images/tt4.png',
 'images/tt5.png',
  'images/tt6.png',
  'images/tt7.png',
  'images/tt8.png',
  'images/tt9.png',
  'images/pic09.jpg',
  'images/comodo_secure_seal_100x85_transp.png',
  'images/logo49.png',
  'offline.html'

];
       
//for install
self.addEventListener('install', function(event) {
  event.waitUntil(
    caches.open(CACHE_NAME)
    .then(function(cache) {
      return cache.addAll(urlsToCache);
    }).then(function (){
        return self.skipWaiting();
    })
  );
});

//for activate

self.addEventListener('activate',e => {
  e.waitUntil(
    caches.keys().then(keyList => {
      return Promise.all(keyList.map(key => {
        if (key !== CACHE_NAME) return caches.delete(key);
      }));
    }));
  return self.clients.claim();
});


//for fetch
self.addEventListener('fetch', function(event) {
  event.respondWith(
    caches.match(event.request)
    .then(function(response) {
      return response || fetch(event.request);
    }).catch(function() {
      return caches.match('offline.html');
    })

  );
});

self.addEventListener('notificationclick', function(e) {
  var notification = e.notification;
  var primaryKey = notification.data.primaryKey;
  var action = e.action;

  if (action === 'close') {
    notification.close();
  } else {
    clients.openWindow('home');
    notification.close();
  }
});


self.addEventListener('push', function(e) {
  var options = {
    body: 'This notification was generated from a push!',
    icon: 'images/ic_launcher/res/mipmap-xhdpi/ic_launcher.png',
    vibrate: [100, 50, 100],
    data: {
      dateOfArrival: Date.now(),
      primaryKey: '2'
    }
   
  };
  e.waitUntil(
    self.registration.showNotification('Hello world!', options)
  );
});

