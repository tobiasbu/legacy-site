
const chalk = require('chalk');
var ghpages = require('gh-pages');
var path = require('path');

var gitlast = require('git-last-commit');


const error = chalk.bold.red;
const log = chalk.bold.blue;
const success = chalk.bold.green;

var config = {
  branch: 'master',
  push: true,
  remote: 'release',
  silent: false,
  user: {
    name: 'Tobias Ulrich',
    email: 'flamenco.bluegrass@gmail.com'
  }
};



var chain = new Promise(

  function(resolve, reject) {

    gitlast.getLastCommit(function(err, commit) {

      var commitMessage = "Blog updates..."

      if (err)
      {
        console.error(error('error:') +  'Failed to get last commit information!', err);
        reject(err);
      } 
      else
      {
        
        //console.log(commit);


        commitMessage = commit.subject; //body.replace('/-/g', " ");
        
      }

      resolve(commitMessage);

    })
});

chain.then(function(commitMessage) {

  console.log(log('log:') + ' Starting deploying.');
  console.log(log('log:') + ' Commit: ' + chalk.underline('%s'),commitMessage);

  config.message = commitMessage;

  ghpages.publish(path.join(__dirname, '_site'), config, (err) => {
    if (err) {
      console.error(error('error: '), err)
    } else {
      console.log(log('log:') + success(' Deploying is Done!'));
    }
  })
});

