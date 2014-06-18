inject = require('gulp-inject')
htmlmin = require('gulp-htmlmin')

module.exports =
    dev: ({gulpsrc, gulpdest, gulptoinject, ignorePath}) ->
        gulpsrc
            .pipe(inject(gulptoinject, ignorePath: ignorePath))
            .pipe(gulpdest)

    prod: ({gulpsrc, gulpdest, gulptoinject, ignorePath}) ->
        gulpsrc
            .pipe(inject(gulptoinject, ignorePath: ignorePath))
            .pipe(htmlmin(
                collapseWhitespace: true
                removeComments: true
            ))
            .pipe(gulpdest)

