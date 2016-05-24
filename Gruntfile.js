
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
  grunt.task.registerTask('push-pages', function(){
      var shell = require('shelljs');
       shell.exec('git subtree split --prefix docs -b gh-pages');
       shell.exec('git push -f origin gh-pages:gh-pages');
       shell.exec('git branch -D gh-pages')
   });

};
