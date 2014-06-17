clean = require('gulp-clean')

module.exports = ({gulpsrc}) ->
    gulpsrc
        .pipe(clean())

