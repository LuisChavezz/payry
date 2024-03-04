const functions = require("firebase-functions");
const admin = require("firebase-admin");
const fetch = require("node-fetch");

exports.generateToken = functions.https.onCall(async (data, context) => {
  const { uid, test } = data;

  // Test url for the API
  const testUrl = "https://qa-api.payry.mx/auth/generateToken";

  // Prod url for the API
  const prodUrl = "https://api.payry.mx/auth/generateToken";

  try {
    const req_api = await fetch(test ? testUrl : prodUrl, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ uid }),
    });

    const response_json = await req_api.json();

    if (response_json.statusCode > 250) {
      return response_json.error[0].message;
    }

    return response_json.data.token;
  } catch (error) {
    return error.message;
  }
});
