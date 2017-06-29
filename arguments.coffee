# Sets all the arguments

args = {}

# Assume the first argument is the name of task to run.
# Run the watch task if none is provided
args.taskName = if yargs.argv._[0] then yargs.argv._[0] else "default"

# Set the environment
args.env = if yargs.argv.e && yargs.argv.e != true then yargs.argv.e else "development"

# Determine the environment (default to development)
# Available environments include development and production
args.production  = args.env == "production"
args.development = args.env == "development"

# Determine whether the icons stylesheet is to be generated
args.icons = if yargs.argv.i then true else false


# Flags
# TODO: Enable browser-sync
# TODO: Enable livereload
# TODO: Enable verbose

# Make the arguments globally available
module.exports = args
