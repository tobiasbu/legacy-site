module.exports = function(eleventyConfig) {
  return {
    dir: {
      input: "src",
      output: "dist"
    },
		markdownTemplateEngine: "njk",
		htmlTemplateEngine: "njk"
  }
};