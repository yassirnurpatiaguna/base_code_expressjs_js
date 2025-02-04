const express = require("express");
const router = express.Router();

const authRoutes = require("../api/v1/routes/authRoutes");
const userRoutes = require("../api/v1/routes/userRoutes");
const postRoutes = require("../api/v1/routes/postRoutes");

router.use("/v1/auth", authRoutes);
router.use("/v1/users", userRoutes);
router.use("/v1/posts", postRoutes);

module.exports = router;
