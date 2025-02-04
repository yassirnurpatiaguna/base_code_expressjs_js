import globals from "globals";
import pluginJs from "@eslint/js";
import prettierPlugin from "eslint-plugin-prettier";

/** @type {import('eslint').Linter.FlatConfig[]} */
export default [
  {
    files: ["**/*.js"],
    languageOptions: {
      sourceType: "commonjs",
      ecmaVersion: 11,
      globals: {
        ...globals.node, // ✅ Equivalent to "env": { "node": true }
        ...globals.es2020, // ✅ Equivalent to "env": { "es2020": true }
        ...globals.browser, // ✅ If you want browser globals
      },
    },
    plugins: {
      prettier: prettierPlugin, // ✅ Correctly import the Prettier plugin
    },
    rules: {
      "no-console": "off",
      "prettier/prettier": "error", // ✅ Now works correctly
    },
  },

  pluginJs.configs.recommended, // ✅ Ensures ESLint recommended rules
];
