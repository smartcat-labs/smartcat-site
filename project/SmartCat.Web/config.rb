# Routs
http_path = "/"
css_dir = "css"
sass_dir = "scss"
images_dir = "img"
javascripts_dir = "scripts"
fonts_dir = "fonts"

# Options
output_style = :compressed
relative_assets = true
line_comments = false

# Don't append query strings ('?2011051020102') to assets:
asset_cache_buster :none

require "rgbapng"