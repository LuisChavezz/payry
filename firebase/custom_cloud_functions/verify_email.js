const functions = require("firebase-functions");
const admin = require("firebase-admin");
const fetch = require("node-fetch");

exports.verifyEmail = functions.https.onCall(async (data, context) => {
  const { email } = data;

  try {
    const req_api = await fetch("https://api.payry.mx/auth/send-verify-mail", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        email,
      }),
    });

    const response_json = await req_api.json();
    return response_json.data;
  } catch (error) {
    throw new functions.https.HttpsError(
      "internal",
      "Error al enviar verificación de correo electrónico",
      error.message,
    );
  }
});
