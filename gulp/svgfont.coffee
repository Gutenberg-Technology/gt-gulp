iconfont = require('gulp-iconfont')
iconfontCss = require('gulp-iconfont-css')
cssfont64 = require('gulp-cssfont64')
rename = require('gulp-rename')

module.exports =
    svg2font: ({gulpsrc, gulpdest, fontPath, iconsScss, name}) ->
        gulpsrc
            .pipe(iconfontCss({
                fontName: name
                targetPath: iconsScss
                fontPath: fontPath
                path: 'src/public/gt-ui/icons/_icons.scss'
            }))
            .pipe(iconfont(fontName: name))
            .pipe(gulpdest)

    font2scss: ({gulpsrc, gulpdest}) ->
        gulpsrc
            .pipe(cssfont64())
            .pipe(rename("_iconsfont.scss"))
            .pipe(gulpdest)
