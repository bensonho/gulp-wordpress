# CSS Related tasks

# Generate the CSS from SASS files
gulp.task "css", ->
  helper.out "Running Css task"

  gulp.src "#{config.css.src}/**/*.+(scss|less)"
    # Include the source maps for debugging
    .pipe gulpIf(args.development, sourceMaps.init())

    # Compile Sass
    .pipe gulpIf(config.wordpress.css == "sass", sass())
    .on('error', sass.logError)

    # Or compile Less
    .pipe gulpIf(config.wordpress.css == "less", less())

    .pipe autoprefixer(browsers: ['last 10 versions'])

    .pipe gulpIf(args.development, sourceMaps.write())

    # Optimize the CSS using uglifyCss
    .pipe gulpIf(args.production, uglifyCss())

    .pipe gulp.dest(config.wordpress.theme.dest)

    # Generate a size report
    .pipe sizeReport(gzip: true, total: false)

    # Live reload hook
    .pipe liveReload()
