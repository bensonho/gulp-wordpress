
config = {}
config.base = path.resolve()

# Default settings
config.wordpress =
  host:        "localhost"
  version:     "latest"
  folder:      "#{config.base}/wordpress"
  themeName:   "THEME"
  themeFolder: "theme"
  liveReload:  true
  browserSync: true
  css:         "sass"
  plugins:     []


# TODO: remove the hardcoding of the theme path
if fs.existsSync "#{config.base}/config.yml"
  userConfig = yaml.safeLoad(fs.readFileSync("#{config.base}/config.yml", "utf8"))
  config.wordpress = objectMerge(config.wordpress, userConfig.config)


config.wordpress.theme =
  src:  "#{config.base}/#{config.wordpress.themeFolder}"
  dest: "#{config.wordpress.folder}/wp-content/themes/#{config.wordpress.themeName}"

config.app =
  src: "#{config.wordpress.theme.src}/app"
  dest: config.wordpress.theme.dest

config.icons =
  src: "#{config.wordpress.theme.src}/icons"
  dest: "#{config.wordpress.theme.dest}/fonts/icons"

config.php =
  src:  "#{config.wordpress.theme.src}/php"
  dest: config.wordpress.theme.dest

cssType = if config.wordpress.css == "sass" then "sass" else "less"

config.css =
  base: "#{config.wordpress.theme.src}/stylesheets"
  src:  "#{config.wordpress.theme.src}/stylesheets/#{cssType}"

config.js =
  base:   "#{config.wordpress.theme.src}/javascripts"
  src:    "#{config.wordpress.theme.src}/javascripts/js"
  coffee: "#{config.wordpress.theme.src}/javascripts/coffee"

config.images =
  src:  "#{config.wordpress.theme.src}/images"
  dest: "#{config.wordpress.theme.dest}/images"


# Make the config variable globally available
module.exports = config
