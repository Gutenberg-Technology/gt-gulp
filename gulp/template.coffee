templateCache = require('gulp-angular-templatecache')

module.exports = ({gulpsrc, gulpdest, module}) ->
    gulpsrc
        .pipe(templateCache(module: module))
        .pipe(gulpdest)

