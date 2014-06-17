karma = require('gulp-karma')

module.exports =  ({gulpsrc, action}) ->
    gulpsrc
        .pipe(karma(
            configFile: 'karma.conf.coffee'
            action: action
        ))
