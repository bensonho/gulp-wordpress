
# Initializes WordPress Theme Builder
gulp.task "init", (cb) ->
  runSequence(
    "theme-init"
    "wp-init"
    "default"
    cb
  )

gulp.task "theme-init", ->

  # Create the theme folders
  folders = [
    config.wordpress.theme.src
    config.app.src
    config.php.src
    "#{config.wordpress.theme.src}/stylesheets"
    config.css.src
    "#{config.wordpress.theme.src}/javascripts"
    config.js.coffee
    config.js.src
    config.images.src
  ]

  for folder in folders
    fs.mkdirSync(folder) unless fs.existsSync(folder)

  # Create the config file
  unless fs.existsSync("#{config.wordpress.theme.src}/config.yml")
    fs.createWriteStream("#{config.wordpress.theme.src}/config.yml")

  # Create the index.coffee
  unless fs.existsSync("#{config.js.coffee}/index.coffee")
    fs.createWriteStream("#{config.js.coffee}/index.coffee")



# Clean up WordPress Theme Builder
gulp.task "clean", (cb) ->
  helper.out "Running Clean task"

  # Clear out all folders in the theme
  del.sync([
    "#{config.wordpress.theme.dest}/**/*"
    "#{config.wordpress.theme.dest}"
  ], force: true)

  cb()


# Default function of WordPress Theme Builder
gulp.task "default", (cb) ->
  helper.out "Running Default task"

  gulp.start "clean", "app", "icons", "php", "images", "js", "css"


# Watch function of WordPress Theme Builder
gulp.task "watch", ->
  helper.out "Running Watch task"

  gulp.start "default"

  # Livereload listener
  liveReload.listen()

  watch config.php.src,    -> gulp.start "php"
  watch config.css.src,    -> gulp.start "css"
  watch config.images.src, -> gulp.start "images"
  watch config.js.coffee,  -> gulp.start "js"
  watch config.icons.src,  -> gulp.start "icons"
