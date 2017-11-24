var gulp = require('gulp');
var rename = require('gulp-rename');

gulp.task('build', function() {
  gulp.src('index.js')
    .pipe(gulp.dest('dist'));
  gulp.src('index.js')
    .pipe(rename('index.min.js'))
    .pipe(gulp.dest('dist'));
});
