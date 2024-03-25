const functions = require("firebase-functions");
const admin = require("firebase-admin");
const fetch = require("node-fetch");

exports.sendWelcomeEmail = functions.https.onCall(async (data, context) => {
  const { email } = data;

  try {
    const req_api = await fetch(
      `https://api.payry.mx/auth/welcome_email/${email}`,
      {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          // Empty
        }),
      },
    );

    // const response_json = await req_api.json();

    // return response_json;
  } catch (error) {
    // return error.message;
  }
});
