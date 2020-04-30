/**
 * Todo:
 * */
const webpush = require('web-push');
const databaseController = require('./data-base');
const vapid_keys = require('../settings/vapid-keys');


const notif_functions = {
    subscribeUser: (request, response, next) => {
        webpush.setVapidDetails("mailto:", vapid_keys.publicKey, vapid_keys.privateKey);
        let subscription = request.body.subNot;
        let payload = JSON.stringify({
            title: "SUBSCRIPTION",
            description: "SUBSCRIPTION AU SERVICE PUSH DE MOBILITY CERMIX"
        });
        databaseController.saveSubscription(request.body);
        webpush.sendNotification(subscription, payload)
            .catch(err => {
                console.log(err)
            });
    },
    sendNotificationToUsers: (id_user) => {
        // todo : send notification to user
        webpush.setVapidDetails("mailto:", vapid_keys.publicKey, vapid_keys.privateKey);
        Promise.all([databaseController.promiseGetNotifications(id_user), databaseController.promiseGetSubscription(id_user)])
            .then((values) => {
                let listNotifications = [];
                let listSubscriptions = [];

                listNotifications = values[0];
                listSubscriptions = values[1];

                if (listSubscriptions.length === 0 || listNotifications.length === 0) { }
                else {
                    for (let not = 0; not < listNotifications.length; not ++) {
                        for (let sub = 0; sub < listSubscriptions.length; sub ++) {
                            webpush.sendNotification(listSubscriptions[sub], JSON.stringify( listNotifications[not] ))
                                .catch( err => {
                                    console.log(err);
                                });
                        }
                    }
                }
            });
    }
};

module.exports = notif_functions;
