/**
 * This file contains all functions need to write a journal use of
 * the server and it's help to detect all bugs and errors.
 * */
const file = require('fs');
const pathGeneralLogs = "./log_server/push_system_general_log.txt";
const pathErrorsLogs = "./log_server/push_system_errors_log.txt";


const serverLog = {
    generalLog: (source, message) => {
        let line = "" + Date() + " | src: " + source + " | msg: " + message + "\n";
        file.appendFile(pathGeneralLogs, line, (err) => {
            if (err) {
                throw err;
            }
        });
    },
    errorLog: (source, message) => {
        let line = "" + Date() + " | src: " + source + " | msg: " + message + "\n";
        file.appendFile(pathErrorsLogs, line, (err) => {
            if (err) {
                throw err;
            }
        });
    }
}


module.exports = serverLog;
