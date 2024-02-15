const functions = require("firebase-functions");
const admin = require("firebase-admin");

exports.testCloudFunction = functions.https.onCall((data, context) => {
  const { param1, param2 } = data;

  console.log(param1);

  const response = {
    message: "Esta es una Cloud Function de prueba",
    timestamp: new Date().toISOString(),
  };

  return param2;
});
