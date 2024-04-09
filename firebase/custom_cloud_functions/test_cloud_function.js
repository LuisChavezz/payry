const functions = require("firebase-functions");
const admin = require("firebase-admin");

exports.testCloudFunction = functions
  .region("us-central1")
  .https.onCall((data, context) => {
    const message = "It's a test response :)";

    print(message);
    return message;
  });
