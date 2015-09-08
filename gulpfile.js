var gulp = require('gulp');
var browserify = require('gulp-browserify');
var rename = require('gulp-rename');

gulp.task('default', function() {
    gulp.watch('./src/*.coffee', ['coffee'])
});

gulp.task('coffee', function() {
    gulp.src('src/client.coffee', { read: false })
        .pipe(browserify({
            transform: ['coffeeify'],
            extensions: ['.coffee']
        }))
        .pipe(rename('app.js'))
        .pipe(gulp.dest('./public'))
});




