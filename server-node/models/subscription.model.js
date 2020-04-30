/**
 * Description of a subscription
 *    endpoint:
 *    auth:
 *    p256dh
 * */

const subscription_model = {
    createSubrcription: (endpoint, auth, p256dh) => {
        return {
            endpoint: endpoint,
            keys: {
                auth: auth,
                p256dh: p256dh
            }
        };
    }
};

module.exports = subscription_model;
