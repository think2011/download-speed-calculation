gulp        = require 'gulp'
watch       = require 'gulp-watch'
clean       = require 'gulp-clean'
plumber     = require 'gulp-plumber'
webserver   = require 'gulp-webserver'
coffee      = require 'gulp-coffee'
sourcemaps  = require 'gulp-sourcemaps'
runSequence = require 'run-sequence'


# 路径
paths = 
  dest: 'dist'
  src : 'src'

# 文件类型
files =
  coffee: "#{paths.src}/**/*.coffee"
  js    : "#{paths.src}/**/*.js"
  html  : "#{paths.src}/**/*.html"
  css   : "#{paths.src}/**/*.css"
  jpg   : "#{paths.src}/**/*.jpg"
  png   : "#{paths.src}/**/*.png"
  gif   : "#{paths.src}/**/*.gif"
  eot   : "#{paths.src}/**/*.eot"
  svg   : "#{paths.src}/**/*.svg"
  ttf   : "#{paths.src}/**/*.ttf"
  woff  : "#{paths.src}/**/*.woff"
  otf   : "#{paths.src}/**/*.otf"


# 开发模式-默认
gulp.task 'default', ->
  runSequence 'clean', 'copy', 'css', 'html', 'coffee', 'webserver', 'watch'


gulp.task 'webserver', ->
  gulp.src paths.dest
  .pipe webserver
    host            : '127.0.0.1'
    port            : 1991
    livereload      : true
    open            : true
    directoryListing: {enable:true, path: paths.dest}


gulp.task 'watch', ->
  watch files.coffee, (files, callback) ->
    gulp.start "coffee"
    callback()

  watch files.html, (files, callback) ->
    gulp.start "html"
    callback()

  watch files.css, (files, callback) ->
    gulp.start "css"
    callback()


gulp.task 'clean', ->
  gulp.src paths.dest
  .pipe clean force: true


gulp.task 'copy', ->
  gulp.src [
    files.js
    files.jpg
    files.png
    files.gif
    files.eot
    files.svg
    files.ttf
    files.woff
    files.otf
  ]
  .pipe gulp.dest paths.dest


gulp.task 'coffee', ->
  gulp.src files.coffee
  .pipe plumber()
  .pipe sourcemaps.init() 
  .pipe coffee()
  .pipe sourcemaps.write './'
  .pipe gulp.dest paths.dest


gulp.task 'html', ->
  gulp.src files.html
  .pipe gulp.dest paths.dest


gulp.task 'css', ->
  gulp.src files.css
  .pipe gulp.dest paths.dest

