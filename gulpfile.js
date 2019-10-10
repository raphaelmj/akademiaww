var gulp = require('gulp');
var less = require('gulp-less');
var path = require('path');
var minify = require('gulp-minify');

gulp.task('less', function () {
    return gulp.src('./static/less/front.less')
        .pipe(less({
            paths: [ path.join(__dirname, 'less', 'includes') ]
        }))

        .pipe(gulp.dest('./static/assets'));
});
