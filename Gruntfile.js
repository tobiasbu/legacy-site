
module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),

  });

  // Load the plugin that provides the "uglify" task.
  //grunt.loadNpmTasks('grunt-contrib-uglify');

  // Default task(s).
  //grunt.registerTask('default', ['uglify']);

  // push-pages
  grunt.registerTask('push-pages', function(){
      var shell = require('shelljs');

      var branch = 'gh-pages';

      grunt.log.write("Deploy builded site to " + branch + ":\n");

       shell.exec("git checkout gh-pages");
       shell.exec("git rm -rf .");
       shell.exec('git subtree split --prefix docs -b gh-pages');
       shell.exec('git push -f origin gh-pages:gh-pages');
       //shell.exec('git branch -D gh-pages')
   });

};
