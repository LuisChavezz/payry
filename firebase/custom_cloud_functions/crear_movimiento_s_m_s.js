const functions = require("firebase-functions");
const admin = require("firebase-admin");
const fetch = require("node-fetch");

exports.crearMovimientoSMS = functions.https.onCall(async (data, context) => {
  // amount & concept parameters
  const { monto, concepto, token, celularcliente, smsId } = data;

  try {
    const req_api = await fetch("https://api.payry.mx/stp/cobro-sms", {
      method: "POST",
      headers: {
        Authorization: `Bearer ${token}`,
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        monto,
        concepto,
        celular_cliente: celularcliente,
        qr_or_sms_id: smsId,
      }),
    });

    const response_json = await req_api.json();

    return response_json;
  } catch (error) {
    return error.message;
  }
});
