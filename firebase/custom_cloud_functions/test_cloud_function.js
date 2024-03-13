const functions = require("firebase-functions");
const admin = require("firebase-admin");

exports.testCloudFunction = functions.https.onCall((data, context) => {
  // const {  } = data;

  return "It's a test response >:D";
});
