rimraf = require('gulp-rimraf')

module.exports = ({gulpsrc}) ->
    gulpsrc
        .pipe(rimraf())

