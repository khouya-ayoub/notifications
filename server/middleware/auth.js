const jwt = require('jsonwebtoken');

module.exports = (request, response, next) => {
    try {

        let token = request.headers.authorization.split(' ')[1];
        let decodedToken = jwt.verify(token, 'RANDOM_TOKEN_SECRET');
        let userId = decodedToken.userId;

        if (request.body.userId && request.body.userId !== userId) {
            throw 'User ID non valable !';
        } else {
            next();
        }
    } catch (error) {
        response.status(401).json({
            error: error |
                'Request not authenticated !'
        });
    }
}
