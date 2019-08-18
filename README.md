# WordPress Theme Builder


(Currently in development)

This script aims to improve the process of creating a wordpress theme from scratch by providing a few subjective conventions that make theme development a bit more enjoyable and also the end product of the theme optimized for use.

## Features ##

* An intuitive structure for organizing files, which compile to the correct wordpress structure.
* Coffeescript and SCSS, concatenization and minification.
* Ability to include css bower libraries
* Image optimisation both for asset and upload files.
* My personal library of wordpress based utility/helper functions automatically included.


## Installation ##
1. Clone repo: `git clone git@github.com:bensonho/wordpress-theme-builder.git`
2. `cd wordpress-theme-builder/`
3. Install globally: `npm install ./ -g`

## Usage ##

Run in the directory above your `theme/` directory. A `wordpress/` directory will be created if it doesn't already exist.

* `wptb init`
  * Same as running `wptb theme-init`, `wptb wp-init` and `wptb`
* `wptb theme-init`
  * Initialize `theme/` directory
* `wptb wp-init`
  * Initialize `wordpress/` directory by downloding WordPress and WordPress plugins as specified in `config.yml`
* `wptb wp-install-plugins`
  * Install plugins specified in `config.yml`
* `wptb`
  * Compiles the theme
* `wptb -e production`
  * Specify the environment
* `wptb watch`
  * Watch `theme/` directory and recompile whenever a file changes
