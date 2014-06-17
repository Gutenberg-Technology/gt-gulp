inject = require('gulp-inject')
htmlmin = require('gulp-htmlmin')

module.exports =
    dev: ({gulpsrc, gulpdest, gulptoinject}) ->
        gulpsrc
            .pipe(inject(gulptoinject, ignorePath: 'dist/public/'))
            .pipe(gulpdest)

    prod: ({gulpsrc, gulpdest, gulptoinject}) ->
        gulpsrc
            .pipe(inject(gulptoinject, ignorePath: 'dist/public/'))
            .pipe(htmlmin(
                collapseWhitespace: true
                removeComments: true
            ))
            .pipe(gulpdest)

