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

var gitlast = require('git-last-commit');


var config = {
  branch: 'master',
  push: true,
  remote: 'release',
  silent: false,
  logger: function(message) 
  {
    console.log('log: ' + message);
  }
};


var chain = new Promise(

  function(resolve, reject) {

    gitlast.getLastCommit(function(err, commit) {

      var commitMessage = "Blog updates..."

      if (err)
      {
        console.error('error: Failed to get last commit information', err);
      } 
      else
      {
        if (commit.body !== undefined)
        {
          commitMessage = commit.body.replace(/-/g, " ");
        }
      }

      resolve(commitMessage);

    })
});

chain.then(function(commitMessage) {

  console.log('log: Starting deploying:\nlog: Commit: ' + commitMessage);

  config.message = commitMessage;

  ghpages.publish(path.join(__dirname, '_site'), config, (err) => {
    if (err) {
      console.error('error: ', err)
    } else {
      console.log('log: Deploying is Done!')
    }
  })
});

