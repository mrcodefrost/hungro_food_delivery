
const functions = require("firebase-functions");
const axios = require("axios");

exports.getDataFromUrl = functions.https.onCall(async (data, context) => {
  const url = data.url;
  try {
    const response = await axios.get(url);
    return response.data;
  } catch (error) {
    return {error: "Failed to get data from provided URL. :CF getDataFromUrl"};
  }
});

