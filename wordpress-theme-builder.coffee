# NPM Functions
global.browserSync  = require "browser-sync"
global.dateFormat   = require "dateformat"
global.del          = require "del"
global.fs           = require "graceful-fs"
global.objectMerge  = require "object-merge"
global.path         = require "path"
global.runSequence  = require "run-sequence"
global.util         = require "util"
global.yargs        = require "yargs"

# Gulp tasks
global.gulp         = require "gulp"
global.bower        = require "gulp-bower"
global.coffee       = require "gulp-coffee"
global.concat       = require "gulp-concat"
global.download     = require "gulp-download"
global.gulpIf       = require "gulp-if"
global.htmlClean    = require "gulp-htmlclean"
global.imageMin     = require "gulp-imagemin"
global.less         = require "gulp-less"
global.liveReload   = require "gulp-livereload"
global.sass         = require "gulp-sass"
global.sizeReport   = require "gulp-sizereport"
global.sourceMaps   = require "gulp-sourcemaps"
global.uglify       = require "gulp-uglify"
global.uglifyCss    = require "gulp-uglifycss"
global.unzip        = require "gulp-unzip"
global.watch        = require "gulp-watch"

# WordPress Theme Builder functions
global.helper       = require "./helper"
global.args         = require "./arguments"
global.config       = require "./config"

# WordPress Theme Builder tasks
require "./gulp-tasks/app"
require "./gulp-tasks/css"
require "./gulp-tasks/images"
require "./gulp-tasks/init"
require "./gulp-tasks/js"
require "./gulp-tasks/php"
require "./gulp-tasks/wordpress"


# Run the selected task if it exists
if gulp.tasks[args.taskName]
  gulp.start args.taskName

# Display the help
else if args.taskName == "help"
  helper.help()

# Display an error and the help
else
  helper.out("'#{args.taskName}' task does not exist.")
  helper.help()


