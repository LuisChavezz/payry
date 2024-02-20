const functions = require("firebase-functions");
const admin = require("firebase-admin");
const fetch = require("node-fetch");

exports.getBalance = functions.https.onCall(async (data, context) => {
  const { token } = data;

  try {
    const req_api = await fetch("https://api.payry.mx/stp/balance", {
      method: "GET",
      headers: {
        Authorization: `Bearer ${token}`,
        "Content-Type": "application/json",
      },
    });

    const response_json = await req_api.json();
    return response_json;
  } catch (error) {
    return error.message;
  }
});
