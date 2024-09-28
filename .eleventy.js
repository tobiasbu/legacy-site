module.exports = function(eleventyConfig) {
  return {
    dir: {
      input: "src",
      output: "dist",
      includes: "includes",
      data: "data",
    },
		markdownTemplateEngine: "njk",
		htmlTemplateEngine: "njk"
  }
};