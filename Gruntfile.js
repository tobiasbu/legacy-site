
module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),

    postcss: {
        options: {
        /*  map: true, // inline sourcemaps

          // or
          map: {
              inline: false, // save all sourcemaps as separate files...
              annotation: 'dist/css/maps/' // ...to the specified directory
          },*/

          processors: [
            //require('pixrem')(), // add fallbacks for rem units
            require('postcss-import')(),
            //require('postcss-cssnext')({browsers: 'last 2 versions'}), // add vendor prefixes
            require('autoprefixer')({browsers: ['last 2 versions']}),
            require('postcss-font-magician')(),
            require('cssnano')() // minify the result
          ]
        },
        dist: {
          src: 'srccss/main.css',//'css/*.css'
          dest: '_includes/css/main.css'//'./css'
        }
      }
  });

  // Load the plugin that provides the "uglify" task.
  //grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-postcss');

  // Default task(s).
  grunt.registerTask('default', ['postcss']);


  // push-pages
  /*grunt.registerTask('push-pages', function(){
      var shell = require('shelljs');

      var branch = 'gh-pages';

      grunt.log.write("Deploy builded site to " + branch + ":\n");

       shell.exec("git checkout gh-pages");
       shell.exec("git rm -rf .");
       shell.exec('git subtree split --prefix docs -b gh-pages');
       shell.exec('git push -f origin gh-pages:gh-pages');
       //shell.exec('git branch -D gh-pages')
   });*/

};
