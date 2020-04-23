console.log("Service Worker Loaded...");

console.log("Service Worker Loaded...");

self.addEventListener("push", (e) => {
  const data = e.data.json();
  console.log("Push Recieved...");
  self.registration.showNotification(data.title,{
    body: data.description,
    icon: "logo.jpg",
  });
  return true;
});

self.addEventListener('notificationclick', (e) => {
  if (!e.action) {
    console.log("Notification cliqué !");
    return true;
  }
  switch (e.action) {
    case 'coffee-action':
      console.log('User ❤️️\'s coffee.');
      break;
    case 'doughnut-action':
      console.log('User ❤️️\'s doughnuts.');
      break;
    case 'gramophone-action':
      console.log('User ❤️️\'s music.');
      break;
    case 'atom-action':
      console.log('User ❤️️\'s science.');
      break;
    default:
      console.log(`Unknown action clicked: '${e.action}'`);
      break;
  }
});
