const admin = require("firebase-admin/app");
admin.initializeApp();

const testCloudFunction = require("./test_cloud_function.js");
exports.testCloudFunction = testCloudFunction.testCloudFunction;
