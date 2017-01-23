let path = require('path');

let gulp = require('gulp');
let clean = require('gulp-clean');
let dart = require("gulp-dart");
let uglify = require('gulp-uglify');
let header = require('gulp-header');

let {paths} = require('./config');

function headerStream() {
  return header(
    `// ==UserScript==
// @name          敲起来
// @description   当你在敲击键盘的时候, 出现相应键位的动画特效
// @version       ${require('../package.json').version}
// @author        Axetroy
// @include       *
// @grant         none
// @run-at        document-start
// @namespace         https://greasyfork.org/zh-CN/users/3400-axetroy
// @license           The MIT License (MIT); http://opensource.org/licenses/MIT
// ==/UserScript==

// Github源码: https://github.com/axetroy/type-up

`);
}

gulp.task('clean', function () {
  return gulp.src(path.join(paths.dist, '*.*'), {read: false})
    .pipe(clean());
});

gulp.task('script', function () {
  return gulp.src(path.join(paths.src, '*.dart'))
    .pipe(dart({
      "dest": paths.dist,
      // "checked": true
    }))
    .pipe(headerStream())
    .pipe(gulp.dest(''));
});

gulp.task('build', function () {
  return gulp.src(path.join(paths.src, '*.dart'))
    .pipe(dart({
      "dest": paths.dist,
      "minify": "true",
      // "checked": true
    }))
    .pipe(uglify())
    .pipe(headerStream())
    .pipe(gulp.dest(''));
});

gulp.task('watch', ['clean', 'build'], function () {
  gulp.watch(path.join(paths.src, '*.dart'), ['build']);
});

gulp.task('default', ['clean'], function () {
  // gulp.start('build');
});