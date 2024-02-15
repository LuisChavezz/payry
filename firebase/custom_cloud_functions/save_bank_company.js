const functions = require("firebase-functions");
const admin = require("firebase-admin");
const fetch = require("node-fetch");

exports.saveBankCompany = functions.https.onCall(async (data, context) => {
  const { uid, clabe } = data;

  try {
    const req_api = await fetch("https://api.payry.mx/companies", {
      method: "PUT",
      headers: {
        Authorization: `Bearer ${uid}`,
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        clabe,
      }),
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
