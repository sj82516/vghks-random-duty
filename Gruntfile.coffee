#global module:false

"use strict"

module.exports = (grunt) ->
  grunt.loadNpmTasks "grunt-bower-task"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-sync"

  opts =
    base_path: '_site/vghks-random-duty/'
    js_path: '_site/vghks-random-duty/vendor/js/'
    css_path: '_site/vghks-random-duty/vendor/css/'
    font_path: '_site/vghks-random-duty/vendor/fonts/'

  files = [
    { expand: true, src: ['assets/**', 'index.html', 'bower.json', 'ChangeLog.md'], dest: '<%= opts.base_path %>'},
    { expand: true, cwd: 'bower_components/jquery/dist/', src: 'jquery.min.*', dest: '<%= opts.js_path %>' },
    { expand: true, cwd: 'bower_components/moment/min/', src: 'moment.min.js', dest: '<%= opts.js_path %>' },
    { expand: true, cwd: 'bower_components/jquery-ui/', src: ['themes/redmond/**'], dest: '<%= opts.css_path %>' },
    { expand: true, cwd: 'bower_components/jquery-ui/', src: 'jquery-ui.min.js', dest: '<%= opts.js_path %>' },
    { expand: true, cwd: 'bower_components/blockUI/', src: 'jquery.blockUI.js', dest: '<%= opts.js_path %>' },
    { expand: true, cwd: 'bower_components/font-awesome/css/', src: 'font-awesome.min.css', dest: '<%= opts.css_path %>' },
    { expand: true, cwd: 'bower_components/font-awesome/fonts/', src: ['*.woff*', '*.ttf', '*.eot'], dest: '<%= opts.font_path %>' },
    { expand: true, cwd: 'bower_components/bootstrap/dist/css/', src: 'bootstrap.min.css', dest: '<%= opts.css_path %>' },
    { expand: true, cwd: 'bower_components/bootstrap/dist/js/', src: 'bootstrap.min.js', dest: '<%= opts.js_path %>' },
    { expand: true, cwd: 'bower_components/bootstrap-switch/dist/css/bootstrap3/', src: 'bootstrap-switch.min.css', dest: '<%= opts.css_path %>' },
    { expand: true, cwd: 'bower_components/bootstrap-switch/dist/js/', src: 'bootstrap-switch.min.js', dest: '<%= opts.js_path %>' },
    { expand: true, cwd: 'bower_components/fullcalendar/dist/', src: ['fullcalendar.min.css', 'fullcalendar.print.css'], dest: '<%= opts.css_path %>' },
    { expand: true, cwd: 'bower_components/fullcalendar/dist/', src: 'fullcalendar.min.js', dest: '<%= opts.js_path %>' },
    { expand: true, cwd: 'bower_components/fullcalendar/dist/', src: 'gcal.js', dest: '<%= opts.js_path %>' },
    { expand: true, cwd: 'bower_components/cryptojslib/rollups/', src: 'md5.js', dest: '<%= opts.js_path %>' },
    { expand: true, cwd: 'bower_components/excellentexport/', src: 'excellentexport.min.js', dest: '<%= opts.js_path %>' },
    { expand: true, cwd: 'bower_components/jquery.contenteditable/', src: 'jquery.contenteditable.js', dest: '<%= opts.js_path %>' },
    { expand: true, cwd: 'bower_components/pace/', src: 'pace.min.js', dest: '<%= opts.js_path %>' },
    { expand: true, cwd: 'bower_components/pace/themes/blue/', src: 'pace-theme-loading-bar.css', dest: '<%= opts.css_path %>' },
    { expand: true, cwd: 'bower_components/js-cookie/src/', src: 'js.cookie.js', dest: '<%= opts.js_path %>' },
    { expand: true, cwd: 'bower_components/marked/', src: 'marked.min.js', dest: '<%= opts.js_path %>' },
    { expand: true, cwd: 'bower_components/html2canvas/build/', src: 'html2canvas.min.js', dest: '<%= opts.js_path %>' },
  ]

  grunt.initConfig
    opts: opts
    sync:
      main:
        files: files
        verbose: true
        pretend: false              # Don't do any disk operations - just write log
        ignoreInDest: ["**/.git/**", "**/ver/**"]  # Never remove js files from destination
        updateAndDelete: true       # Remove all files from dest that are not found in src

    copy:
      main:
        expand: true
        files: files

    watch:
      options:
        livereload: true
      source:
        files: [
          "assets/**/*"
          "*.html"
          "bower.json"
          "ChangeLog.md"
        ]
        tasks: [
          "sync"
        ]

    connect:
      server:
        options:
          port: 4000
          base: '_site'
          livereload: true

  grunt.registerTask "build", [
    "sync"
  ]

  grunt.registerTask "serve", [
    "build"
    "connect:server"
    "watch"
  ]

  grunt.registerTask "default", [
    "serve"
  ]