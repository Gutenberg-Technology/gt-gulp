svgicons2svgfont = require('gulp-svgicons2svgfont')
iconfont = require('gulp-iconfont')
iconfontCss = require('gulp-iconfont-css')
cssfont64 = require('gulp-cssfont64')
concat = require('gulp-concat')
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
           # .pipe(svgicons2svgfont(fontName: name, fontHeight: 50))
            .pipe(gulpdest)

    font2scss: ({gulpsrc, gulpdest}) ->
        gulpsrc
            .pipe(cssfont64())
            #.pipe(concat('all.scss'))
            .pipe(rename("_iconsfont.scss"))
            .pipe(gulpdest)
