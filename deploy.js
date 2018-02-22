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

var config = {
  branch: 'master',
  push: true,
  message: 'Site update',
  remote: 'release',
  silent: false,
  logger: function(message) 
  {
    console.log('log: ' + message);
  }
};

ghpages.publish(path.join(__dirname, '_site'), config, (err) => {
  if (err) {
    console.error('error! ', err)
  } else {
    console.log('deploying is done!')
  }
})
