compass = require('gulp-compass')
minifyCss = require('gulp-clean-css')
prefix = require('gulp-autoprefixer')
plumber = require('gulp-plumber')

module.exports =
    dev: ({gulpsrc, gulpdest, sassDir, sassImageDir, fontDir}) ->
        gulpsrc
            .pipe(plumber())
            .pipe(compass(
                css: 'tmp'
                sass: sassDir
                image: sassImageDir
                font: fontDir
            ))
            .pipe(prefix(["last 2 version", "> 5%"]))
            .pipe(gulpdest)

    prod:  ({gulpsrc, gulpdest, sassDir, sassImageDir, fontDir}) ->
        gulpsrc
            .pipe(compass(
                css: 'tmp'
                sass: sassDir
                image: sassImageDir
                font: fontDir
                comments: false
            ))
            .pipe(prefix(["last 2 version", "> 5%"]))
            .pipe(minifyCss())
            .pipe(gulpdest)

