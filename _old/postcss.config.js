const postcssPresetEnv = require('postcss-preset-env');
const atImport = require("postcss-import");
const pfm = require('postcss-font-magician');

module.exports = {
  plugins: [
    atImport,
    pfm,
    postcssPresetEnv({
      features: {
        'nesting-rules': true,
        'custom-properties': {
          // preserve: false,
        },
        'custom-media-queries': true,
        'logical-properties-and-values': false,
      },
    }),
  ]
}