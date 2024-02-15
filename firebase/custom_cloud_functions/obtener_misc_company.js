const functions = require("firebase-functions");
const admin = require("firebase-admin");
const fetch = require("node-fetch");

exports.obtenerMiscCompany = functions.https.onCall(async (data, context) => {
  const { uid } = data;

  try {
    const req_api = await fetch("https://api.payry.mx/stp/misc", {
      method: "GET",
      headers: {
        Authorization: `Bearer ${uid}`,
        "Content-Type": "application/json",
      },
    });

    if (response_json.statusCode > 250) {
      return response_json.error[0].message;
    }

    const response_json = await req_api.json();
    return response_json.data;
  } catch (error) {
    return error.message;
  }
});
