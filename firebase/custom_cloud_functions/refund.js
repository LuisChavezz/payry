const functions = require("firebase-functions");
const admin = require("firebase-admin");
const fetch = require("node-fetch");

exports.refund = functions.https.onCall(async (data, context) => {
  const { token, id } = data;

  try {
    const req_api = await fetch(`https://api.payry.mx/stp/refund/${id}`, {
      method: "POST",
      headers: {
        Authorization: `Bearer ${token}`,
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        // Empty
      }),
    });

    const response_json = await req_api.json();

    return response_json;
  } catch (error) {
    return error.message;
  }
});
