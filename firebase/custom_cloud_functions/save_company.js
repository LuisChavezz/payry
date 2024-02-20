const functions = require("firebase-functions");
const admin = require("firebase-admin");
const fetch = require("node-fetch");

exports.saveCompany = functions.https.onCall(async (data, context) => {
  const {
    uid,
    name,
    alias,
    email,
    street,
    intnumber,
    colony,
    population,
    state,
    country,
    zipcode,
    status,
    invoicerequired,
    rfc,
    taxregimesid,
    usecfdiid,
  } = data;

  try {
    const req_api = await fetch("https://api.payry.mx/companies", {
      method: "PUT",
      headers: {
        Authorization: `Bearer ${uid}`,
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        name,
        alias,
        email,
        street,
        int_number: intnumber,
        colony,
        population,
        state,
        country,
        zip_code: zipcode,
        status,
        invoice_required: invoicerequired,
        rfc,
        tax_regimes_id: taxregimesid,
        use_cfdi_id: usecfdiid,
      }),
    });

    const response_json = await req_api.json();

    if (response_json.statusCode > 250) {
      return response_json.error[0].message;
    }

    console.log("12:16pm deploy");

    return response_json.data.token;
  } catch (error) {
    return error.message;
  }
});
