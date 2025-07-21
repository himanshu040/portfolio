/**
 * index.js — Firebase Functions to send email
 */

const functions = require("firebase-functions");
const nodemailer = require("nodemailer");

// If you need CORS for `onRequest` version — not needed for `onCall`
/*
const cors = require("cors")({origin: true});
*/

const transporter = nodemailer.createTransport({
  service: "gmail",
  auth: {
    user: "singh.himanshu04051999@gmail.com",
    pass: "syni dizz yoeb df",
  },
});

exports.sendContactEmail = functions.https.onCall(async (data, context) => {
  const mailOptions = {
    from: data.email,
    to: "singh.himanshu04051999@gmail.com",
    subject: `${data.subject} (from ${data.name})`,
    text: data.message,
  };

  try {
    await transporter.sendMail(mailOptions);
    console.log("Email sent!");
    return {success: true};
  } catch (error) {
    console.error("Error sending email:", error);
    throw new functions.https.HttpsError("internal", error.message);
  }
});
