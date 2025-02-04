const helmet = require("helmet");
const xss = require("xss-clean");

module.exports = (app) => {
  app.use(helmet());
  app.use(xss());
};
