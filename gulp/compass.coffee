compass = require('gulp-compass')
minifyCss = require('gulp-clean-css')
prefix = require('gulp-autoprefixer')
plumber = require('gulp-plumber')
rename = require('gulp-rename')

module.exports =
    dev: ({gulpsrc, gulpdest, sassDir, sassImageDir, fontDir, version}) ->
        version ?= '0.0.1'
        gulpsrc
            .pipe(plumber())
            .pipe(compass(
                css: 'tmp'
                sass: sassDir
                image: sassImageDir
                font: fontDir
            ))
            .pipe(prefix(["last 2 version", "> 5%", "ie 10", "ie 9"]))
            .pipe(rename("index-#{ version }.css"))
            .pipe(gulpdest)

    prod:  ({gulpsrc, gulpdest, sassDir, sassImageDir, fontDir, version}) ->
        version ?= '0.0.1'
        gulpsrc
            .pipe(compass(
                css: 'tmp'
                sass: sassDir
                image: sassImageDir
                font: fontDir
                comments: false
            ))
            .pipe(prefix(["last 2 version", "> 5%", "ie 10", "ie 9"]))
            .pipe(minifyCss())
            .pipe(rename("index-#{ version }.css"))
            .pipe(gulpdest)

