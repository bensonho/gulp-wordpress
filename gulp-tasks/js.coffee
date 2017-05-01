# Compile all coffeescripts into javascript
gulp.task "js", ->
  helper.out "Running Javascript task"

  # Compile all coffeescript files into the js folders
  gulp.src "#{config.js.coffee}/**/*.coffee"
    .pipe coffee(bare: true)
    .on('error', (o) -> helper.out(o))
    .pipe gulp.dest(config.js.src)

  # Get the list of javascript files
  coffeeFiles = yaml.safeLoad(fs.readFileSync("#{config.js.base}/index.yml", "utf8"))

  # Concat and minify all javascript files
  for fileName,fileNames of coffeeFiles

    if fileNames != null
      # Append the correct path and js extension
      javascriptFileNames = ("#{config.js.src}/#{javascriptFileName}.js" for javascriptFileName in fileNames)

      gulp.src javascriptFileNames
        # Concat all the Javascript files
        .pipe concat("#{fileName}.js")

        # Minify the javascript
        .pipe gulpIf(args.production, uglify())

        .pipe gulp.dest(config.wordpress.theme.dest)

        # Generate a size report
        .pipe sizeReport(gzip: true, total: false)

        # Live reload hook
        .pipe liveReload()
