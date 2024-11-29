const express = require("express");
const ErrorHandler = require("./middleware/error");
const app = express();
const cookieParser = require("cookie-parser");
const bodyParser = require("body-parser");
const cors = require("cors");
const path = require("path");
const axios = require('axios');

app.use(
  cors({
    origin: "http://localhost:3000",
    credentials: true,
  })
);

app.use(express.json());
app.use(cookieParser());
app.use("/", express.static(path.join(__dirname, "./uploads")));
app.use("/test", (req, res) => {
  res.send("Hello world!");
});

app.use(bodyParser.urlencoded({ extended: true, limit: "50mb" }));

// config
if (process.env.NODE_ENV !== "PRODUCTION") {
  require("dotenv").config({
    path: "config/.env",
  });
}

// import routes
const user = require("./controller/user");
const shop = require("./controller/shop");
const product = require("./controller/product");
const event = require("./controller/event");
const coupon = require("./controller/coupounCode");
const payment = require("./controller/payment");
const order = require("./controller/order");
const conversation = require("./controller/conversation");
const message = require("./controller/message");
const withdraw = require("./controller/withdraw");
const User = require("./model/user");

app.use("/api/v2/user", user);
app.use("/api/v2/conversation", conversation);
app.use("/api/v2/message", message);
app.use("/api/v2/order", order);
app.use("/api/v2/shop", shop);
app.use("/api/v2/product", product);
app.use("/api/v2/event", event);
app.use("/api/v2/coupon", coupon);
app.use("/api/v2/payment", payment);
app.use("/api/v2/withdraw", withdraw);
app.get("/update-role/:id", async (req, res) => {
  try {
    const user = await User.findByPk(req.params.id);
    if (!user)
      return res.status(400).json({
        message: "errror",
      });
    user.role = req.query.role;
    await user.save();
    return res.status(200).json({
      message: "success",
      user
    });
  } catch (error) {
    return res.status(400).json({
      message: error.message,
    });
  }
});
// it's for ErrorHandling
const API_TOKEN = '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';
const API_URL = 'https://api-inference.huggingface.co/models/finiteautomata/bertweet-base-sentiment-analysis';
async function checkModelStatus() {
  try {
      const headers = {
          Authorization: `Bearer ${API_TOKEN}`,
      };
      const response = await axios.get(API_URL, { headers });
      if (response.data.loading) {
          console.log('Mô hình đang tải, vui lòng chờ...');
          return false;
      }
      return true;
  } catch (error) {
      console.error('Không thể kiểm tra trạng thái mô hình:', error.message);
      return false;
  }
}
async function analyzeSentiment(review) {
  try {
      const headers = {
          Authorization: `Bearer ${API_TOKEN}`,
      };
      const response = await axios.post(
          API_URL,
          { inputs: review },
          { headers }
      );
      return response.data;
  } catch (error) {
      console.error('Lỗi phân tích cảm xúc:', error.response ? error.response.data : error.message);
      return null;
  }
}
function getDominantLabel(result) {
  const labels = result[0]; 
  const dominant = labels.reduce((prev, curr) => (curr.score > prev.score ? curr : prev));
  return dominant.label; 
}
(async () => {
  while (!(await checkModelStatus())) {
      console.log('Chờ thêm 10 giây...');
      await new Promise((resolve) => setTimeout(resolve, 10000)); 
  }
  const review = "The camera quality is excellent ";
  const sentimentResult = await analyzeSentiment(review);
  if (sentimentResult) {
      const dominantLabel = getDominantLabel(sentimentResult);
      console.log('Cảm xúc chính:', dominantLabel);
      console.log('Kết quả phân tích chi tiết:', sentimentResult);
  } else {
      console.log('Không thể phân tích cảm xúc.');
  }
})();
app.use(ErrorHandler);
module.exports = app;
