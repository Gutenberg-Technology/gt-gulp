coffee = require('gulp-coffee')
uglify = require('gulp-uglify')
ngAnnotate = require('gulp-ng-annotate')
concat = require('gulp-concat')
plumber = require('gulp-plumber')
sourcemaps = require('gulp-sourcemaps')

module.exports =

    dev: ({gulpsrc, gulpdest}) ->
        gulpsrc
            .pipe(plumber())
            .pipe(sourcemaps.init())
            .pipe(coffee(bare: true))
            .pipe(sourcemaps.write())
            .pipe(gulpdest)

    prod: ({gulpsrc, gulpdest}) ->
        gulpsrc
            .pipe(coffee(bare: true))
            .pipe(gulpdest)

    concatAndUglify: ({gulpsrc, gulpdest, concatfile}) ->
        gulpsrc
            .pipe(concat(concatfile))
            .pipe(ngAnnotate())
            .pipe(uglify())
            .pipe(gulpdest)
