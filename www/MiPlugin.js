var exec = require('cordova/exec');
exports.showWidget = function (arg0, success, error) {
    exec(success, error, 'MiPlugin', 'showWidget', [arg0]);
};
