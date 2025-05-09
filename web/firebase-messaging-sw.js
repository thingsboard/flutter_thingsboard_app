console.log('firebase-messaging-sw.js cargado correctamente');

importScripts('https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js');

const firebaseConfig = {
  apiKey: "AIzaSyDv451tb8_rFWyTjj3LMvqLpHLV7sCGNXw",
  authDomain: "thingsboard-iot-a8a27.firebaseapp.com",
  projectId: "thingsboard-iot-a8a27",
  storageBucket: "thingsboard-iot-a8a27.firebasestorage.app",
  messagingSenderId: "723748549577",
  appId: "1:723748549577:web:e00a904168f6b26dd5ae18",
  measurementId: "G-9LHGMW361E"
};

firebase.initializeApp(firebaseConfig);

const messaging = firebase.messaging();

messaging.onBackgroundMessage(function(payload) {
  console.log("Received background message ", payload);

  const notificationTitle = payload.notification.title;
  const notificationOptions = {
    body: payload.notification.body,
  };

  self.registration.showNotification(notificationTitle, notificationOptions);
});

messaging.setBackgroundMessageHandler(function (payload) {
    const promiseChain = clients
        .matchAll({
            type: "window",
            includeUncontrolled: true
        })
        .then(windowClients => {
            for (let i = 0; i < windowClients.length; i++) {
                const windowClient = windowClients[i];
                windowClient.postMessage(payload);
            }
        })
        .then(() => {
            return self.registration.showNotification("New Message");
        });
    return promiseChain;
});

self.addEventListener('notificationclick', function (event) {
    console.log('Notification received:', event);
});

if ('serviceWorker' in navigator) {
    navigator.serviceWorker.register('/firebase-messaging-sw.js')
        .then(function(registration) {
            console.log('Registration successful, scope is:', registration.scope);
            return messaging.useServiceWorker(registration);
        })
        .catch(function(err) {
            console.log('Service worker registration failed, error:', err);
        });
}