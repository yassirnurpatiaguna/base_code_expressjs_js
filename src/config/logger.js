const winston = require("winston");
const morgan = require("morgan");

const logger = winston.createLogger({
  level: "info",
  format: winston.format.json(),
  transports: [
    new winston.transports.Console(),
    new winston.transports.File({ filename: "logs/error.log", level: "error" }),
  ],
});

const morganMiddleware = morgan("combined", {
  stream: { write: (msg) => logger.info(msg.trim()) },
});

module.exports = { logger, morganMiddleware };
