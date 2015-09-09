var gulp = require('gulp');
var browserify = require('gulp-browserify');
var rename = require('gulp-rename');
var gutils = require('gulp-util');
var less = require('gulp-less');

gulp.task('default', function() {
    gulp.watch('./src/*.coffee', ['coffee']);
    gulp.watch('./src/less/*.less', ['less']);
});

gulp.task('coffee', function() {
    gulp.src('src/client.coffee', { read: false })
        .pipe(browserify({
            transform: ['coffeeify'],
            extensions: ['.coffee']
        }))
        .on('error', gutils.log)
        .pipe(rename('app.js'))
        .pipe(gulp.dest('./public'))
});

gulp.task('less', function() {
    gulp.src('./src/less/style.less')
        .pipe(less())
        .on('error', gutils.log)
        .pipe(gulp.dest('./public'))
});



