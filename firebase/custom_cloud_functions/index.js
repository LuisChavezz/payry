const admin = require("firebase-admin/app");
admin.initializeApp();

const testCloudFunction = require("./test_cloud_function.js");
exports.testCloudFunction = testCloudFunction.testCloudFunction;
const obtenerMiscCompany = require("./obtener_misc_company.js");
exports.obtenerMiscCompany = obtenerMiscCompany.obtenerMiscCompany;
const getStatistics = require("./get_statistics.js");
exports.getStatistics = getStatistics.getStatistics;
const sendInvitation = require("./send_invitation.js");
exports.sendInvitation = sendInvitation.sendInvitation;
const verifyEmail = require("./verify_email.js");
exports.verifyEmail = verifyEmail.verifyEmail;
const refund = require("./refund.js");
exports.refund = refund.refund;
const sendWelcomeEmail = require("./send_welcome_email.js");
exports.sendWelcomeEmail = sendWelcomeEmail.sendWelcomeEmail;
const getBalance = require("./get_balance.js");
exports.getBalance = getBalance.getBalance;
const generateCodi = require("./generate_codi.js");
exports.generateCodi = generateCodi.generateCodi;
const generateToken = require("./generate_token.js");
exports.generateToken = generateToken.generateToken;
const generateDimo = require("./generate_dimo.js");
exports.generateDimo = generateDimo.generateDimo;
const reportCompany = require("./report_company.js");
exports.reportCompany = reportCompany.reportCompany;
const reportUser = require("./report_user.js");
exports.reportUser = reportUser.reportUser;
const sendSms = require("./send_sms.js");
exports.sendSms = sendSms.sendSms;
