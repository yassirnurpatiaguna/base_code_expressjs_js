require("dotenv").config();
const express = require("express");
const cors = require("cors");
const helmet = require("helmet");
const compression = require("compression");
const routes = require("./routes");
const rateLimiter = require("../config/rateLimit");
const { metrics } = require("../monitoring/metrics");
const { logger, morganMiddleware } = require("../config/logger");

const app = express();

// Middlewares
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cors());
app.use(helmet());
app.use(compression());
app.use(rateLimiter);
app.use(morganMiddleware);

// Routes
app.use("/api", routes);
app.get("/metrics", metrics);

// Global Error Handling
app.use((err, req, res) => {
  logger.error(err.stack);
  res.status(500).json({ success: false, message: "Internal Server Error" });
});

// Start Server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => logger.info(`✅ Server running on port ${PORT}`));

module.exports = app;
