#
gulp.task "icons", ->
  helper.out "Running font icons"

  runTimestamp = Math.round(Date.now()/1000)

  gulp.src "#{config.icons.src}/*.svg"
    # Generate the CSS for the icons
    .pipe gulpIf(args.icons, iconfontCss(
      fontName:   "icons"
      targetPath: "../../../../../../_icons.scss" #TODO: undo this relative path
    ))
    .pipe iconFont(
      fontName:       "icons"
      normalize:      true
      fontHeight:     1001
      prependUnicode: true
      formats:        ["ttf", "eot", "woff"]
      timestamp:      runTimestamp
    )
    .pipe gulp.dest(config.icons.dest)
