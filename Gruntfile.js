
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
            require('postcss-cssnext')({browsers: 'last 2 versions'}), // add vendor prefixes
            //require('autoprefixer')({browsers: ['last 2 versions']}),
            require('postcss-font-magician')(),
            require('cssnano')({ autoprefixer: false }) // minify the result
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


  /*
  npm install grunt-real-favicon --save-dev

   grunt.loadNpmTasks('grunt-real-favicon');

   grunt.initConfig({
   	realFavicon: {
   		favicons: {
   			src: 'TODO: Path to your master picture',
   			dest: 'TODO: Path to the directory where to store the icons',
   			options: {
   				iconsPath: '/favicon/',
   				html: [ 'TODO: List of the HTML files where to inject favicon markups' ],
   				design: {
   					ios: {
   						pictureAspect: 'backgroundAndMargin',
   						backgroundColor: '#ffffff',
   						margin: '14%'
   					},
   					desktopBrowser: {},
   					windows: {
   						pictureAspect: 'whiteSilhouette',
   						backgroundColor: '#5b7833',
   						onConflict: 'override'
   					},
   					androidChrome: {
   						pictureAspect: 'backgroundAndMargin',
   						margin: '10%',
   						backgroundColor: '#ffffff',
   						themeColor: '#ffffff',
   						manifest: {
   							name: 'tobiasbu',
   							display: 'browser',
   							orientation: 'notSet',
   							onConflict: 'override',
   							declared: true
   						}
   					},
   					safariPinnedTab: {
   						pictureAspect: 'silhouette',
   						themeColor: '#5b7833'
   					}
   				},
   				settings: {
   					scalingAlgorithm: 'Lanczos',
   					errorOnImageTooSmall: false
   				}
   			}
   		}
   	}
  });*/
};
