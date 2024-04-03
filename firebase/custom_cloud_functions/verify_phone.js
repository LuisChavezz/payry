const functions = require("firebase-functions");
const admin = require("firebase-admin");
const fetch = require("node-fetch");

exports.verifyPhone = functions.https.onCall(async (data, context) => {
  const { token, otp } = data;

  try {
    const req_api = await fetch(`https://api.payry.mx/verify-phone/${otp}`, {
      method: "PATCH",
      headers: {
        Authorization: `Bearer ${token}`,
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        // Empty body
      }),
    });

    const response_json = await req_api.json();

    return response_json;
  } catch (error) {
    return error.message;
  }
});
