
module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),

    postcss_init: {
      options: {
        processors: [
          require('postcss-import')()
        ]
      }
    },

    copy: {
      postcss: {
        files: [
          {
            src: '_css/*.css',
            dest: '_includes/css/',
            expand: true,
            flatten: true
          }
        ]
      }
    },

    postcss: {
        options: {
          map: true, // inline sourcemaps
          // or
         /*map: {
              inline: false, // save all sourcemaps as separate files...
              annotation: '_includes/css/maps/' // ...to the specified directory
          },*/

          processors: [
            require('postcss-import')(),
            /*require('autoprefixer')({browsers: ['last 2 versions']}),*/
            require('postcss-cssnext')({browsers: 'last 2 versions'}), // add vendor prefixes
            require('postcss-css-variables')(),
            
            require('postcss-font-magician')(),

            require('cssnano')({ autoprefixer: false }) // minify the result
          ]
        },
        dist: {
          expand: true,
          src: ['css/*.css'],
          dest:'_includes/'
          
          
          //ext: '.css'
        }
        
      }
  });

  // Load the plugin that provides the "uglify" task.
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
