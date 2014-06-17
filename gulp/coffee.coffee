coffee = require('gulp-coffee')
uglify = require('gulp-uglify')
ngmin = require('gulp-ngmin')
concat = require('gulp-concat')
plumber = require('gulp-plumber')

module.exports =

    dev: ({gulpsrc, gulpdest}) ->
        gulpsrc
            .pipe(plumber())
            .pipe(coffee(sourceMap: true))
            .pipe(gulpdest)

    prod: ({gulpsrc, gulpdest}) ->
        gulpsrc
            .pipe(coffee(sourceMap: false))
            .pipe(gulpdest)

    concatAndUglify: ({gulpsrc, gulpdest, concatfile}) ->
        gulpsrc
            .pipe(concat(concatfile))
            .pipe(ngmin())
            .pipe(uglify())
            .pipe(gulpdest)
