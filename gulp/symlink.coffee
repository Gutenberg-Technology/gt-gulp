symlink = require('gulp-symlink')

module.exports = ({gulpsrc, dist}) ->
    gulpsrc
        .pipe(symlink(dist))
