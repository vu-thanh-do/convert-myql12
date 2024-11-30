const axios = require("axios");

const API_URL = "https://api.openai.com/v1/completions";
const API_TOKEN = "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";  // Thay YOUR_OPENAI_API_KEY bằng key của bạn

// Phân tích cảm xúc và khía cạnh
async function analyzeSentiment(text, retries = 3, delay = 1000) {
    const prompt = `
      Phân tích cảm xúc trong đoạn văn dưới đây theo 2 khía cạnh: sản phẩm và dịch vụ.
      Đoạn văn: "${text}"
    `;
  
    const headers = {
      "Content-Type": "application/json",
      Authorization: `Bearer ${API_TOKEN}`,
    };

    try {
      const response = await axios.post(
        API_URL,
        {
          model: "gpt-3.5-turbo",
          prompt: prompt,
          max_tokens: 100,
          temperature: 0.7,
          top_p: 1,
          n: 1,
          stop: null,
        },
        { headers }
      );
      console.log(response,'prompt')
      return response.data.choices[0].text.trim();
    } catch (error) {
      if (error.response && error.response.status === 429 && retries > 0) {
        console.log("API rate limit exceeded, retrying...");
        await new Promise(resolve => setTimeout(resolve, delay));  // Delay trước khi thử lại
        return analyzeSentiment(text, retries - 1, delay * 2);  // Tăng thời gian delay nếu thử lại
      }
  
      console.error("Lỗi phân tích cảm xúc:", error.message);
      return null;
    }
  }
  
  module.exports = { analyzeSentiment };
