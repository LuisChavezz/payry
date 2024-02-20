const functions = require("firebase-functions");
const admin = require("firebase-admin");
const fetch = require("node-fetch");

exports.sendInvitation = functions.https.onCall(async (data, context) => {
  const { token, email } = data;

  try {
    const req_api = await fetch("https://api.payry.mx/auth/invite", {
      method: "POST",
      headers: {
        Authorization: `Bearer ${token}`,
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
      "Error al enviar la invitación de usuario",
      error.message,
    );
  }
});
