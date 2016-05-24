/**
 * Given the following directory structure:
 *
 *   build/
 *     index.html
 *     js/
 *       site.js
 *
 * The usage below will create a `gh-pages` branch that looks like this:
 *
 *   index.html
 *   js/
 *     site.js
 *
 */

var ghpages = require('gh-pages');
var path = require('path');

ghpages.publish(path.join(__dirname, '_site'), (err) => {
  if (err) {
    console.log('Error!', err)
  } else {
    console.log('Mission accomplished.')
  }
})
