const functions = require("firebase-functions");
const admin = require("firebase-admin");
const fetch = require("node-fetch");

exports.notifyCreationToAdmin = functions.https.onCall(
  async (data, context) => {
    const { uid } = data;

    try {
      const req_api = await fetch(
        `https://api.payry.mx/users/linked_user/${uid}`,
        {
          method: "GET",
        },
      );

      const response_json = await req_api.json();

      return response_json;
    } catch (error) {
      return error.message;
    }
  },
);
