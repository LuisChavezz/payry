const functions = require("firebase-functions");
const admin = require("firebase-admin");
const fetch = require("node-fetch");

exports.getStatistics = functions.https.onCall(async (data, context) => {
  const { startDate, endDate, token, test } = data;

  // Test url for the API
  const testUrl = "https://qa-api.payry.mx/statistics";

  // Prod url for the API
  const prodUrl = "https://api.payry.mx/statistics";

  try {
    const req_api = await fetch(test ? testUrl : prodUrl, {
      method: "POST",
      headers: {
        Authorization: `Bearer ${token}`,
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        startDate,
        endDate,
        token,
      }),
    });

    const response_json = await req_api.json();

    return response_json;
  } catch (error) {
    return error.message;
  }
});
