
const chalk = require('chalk');
const ghpages = require('gh-pages');
const path = require('path');
const gitlast = require('git-last-commit');


const error = chalk.bold.red;
const log = chalk.bold.blue;
const success = chalk.bold.green;

const config = {
  branch: 'master',
  push: true,
  // git@github.com:tobiasbu/tobiasbu.github.io.git
  remote: 'release',
  silent: false,
  user: {
    name: 'Tobias Ulrich',
    email: 'flamenco.bluegrass@gmail.com'
  }
};

const chain = new Promise(

  function (resolve, reject) {

    gitlast.getLastCommit(function (err, commit) {
      let commitMessage = "Blog updates..."
      if (err) {
        console.error(error('error:') + 'Failed to get last commit information!', err);
        reject(err);
      }
      else {
        commitMessage = commit.subject;
      }
      resolve(commitMessage);

    })
  });

chain.then(function (commitMessage) {

  console.log(log('log:') + ' Starting deploying.');
  console.log(log('log:') + ' Commit: ' + chalk.underline('%s'), commitMessage);

  config.message = commitMessage;

  ghpages.publish(path.join(__dirname, '_site'), config, (err) => {
    if (err) {
      console.error(error('error: '), err)
    } else {
      console.log(log('log:') + success(' Deploying is Done!'));
    }
  })
});

