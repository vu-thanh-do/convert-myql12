const express = require("express");
const catchAsyncErrors = require("../middleware/catchAsyncErrors");
const { upload } = require("../multer");
const Shop = require("../model/shop");
const Event = require("../model/event");
const ErrorHandler = require("../utils/ErrorHandler");
const { isSeller, isAdmin, isAuthenticated } = require("../middleware/auth");
const router = express.Router();
const fs = require("fs");

// create event
router.post(
  "/create-event",
  upload.array("images"),
  catchAsyncErrors(async (req, res, next) => {
    try {
      const shopId = req.body.shopId;
      const shop = await Shop.findByPk(shopId);
      if (!shop) {
        return next(new ErrorHandler("Id cửa hàng không hợp lệ!", 400));
      } else {
        const files = req.files;
        const imageUrls = files.map((file) => `${file.filename}`);
        const eventData = req.body;
        console.log(eventData.name);
        eventData.images = imageUrls;
        eventData.shop = shop;

        const product = await Event.create(eventData);
        res.status(201).json({
          success: true,
          product,
        });
      }
    } catch (error) {
      return next(new ErrorHandler(error, 400));
    }
  })
);

// get all events
router.get("/get-all-events", async (req, res, next) => {
  try {
    const events = await Event.findAll({});
    const updatedProducts = events.map(product => {
      const newProduct = product.toJSON(); 
      newProduct.images = JSON.parse(newProduct.images);
      newProduct.shop = JSON.parse(newProduct.shop);
      return newProduct;
    });
    res.status(201).json({
      success: true,
      events :updatedProducts,
    });
  } catch (error) {
    return next(new ErrorHandler(error, 400));
  }
});

// get all events of a shop
router.get(
  "/get-all-events/:id",
  catchAsyncErrors(async (req, res, next) => {
    try {
      const events = await Event.findAll({ where: { shopId: req.params.id } });
      const updatedProducts = events.map(product => {
        const newProduct = product.toJSON(); 
        newProduct.images = JSON.parse(newProduct.images);
        newProduct.shop = JSON.parse(newProduct.shop);
        return newProduct;
      });
      res.status(201).json({
        success: true,
        events :updatedProducts,
      });
    } catch (error) {
      return next(new ErrorHandler(error, 400));
    }
  })
);

// delete event of a shop
router.delete(
  "/delete-shop-event/:id",
  catchAsyncErrors(async (req, res, next) => {
    try {
      const productId = req.params.id;

      const eventData = await Event.findByPk(productId);
      const ImageEvent = JSON.parse(eventData.images)
      ImageEvent.forEach((imageUrl) => {
        const filename = imageUrl;
        const filePath = `uploads/${filename}`;

        fs.unlink(filePath, (err) => {
          if (err) {
            console.log(err);
          }
        });
      });

      const event = await eventData.destroy()

      if (!event) {
        return next(
          new ErrorHandler("Không tìm thấy sự kiện với id này!", 500)
        );
      }

      res.status(201).json({
        success: true,
        message: "Đã xóa sự kiện thành công!",
      });
    } catch (error) {
      return next(new ErrorHandler(error, 400));
    }
  })
);

// all events --- for admin
router.get(
  "/admin-all-events",
  isAuthenticated,
  isAdmin("Admin"),
  catchAsyncErrors(async (req, res, next) => {
    try {
      const events = await Event.findAll({})
      res.status(201).json({
        success: true,
        events,
      });
    } catch (error) {
      return next(new ErrorHandler(error.message, 500));
    }
  })
);

module.exports = router;
