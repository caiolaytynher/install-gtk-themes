#!/bin/fish

# This script should be run with root privileges and with the argument being
# the home folder. It needs privileges because the themes folder is protected.

# Check if home folder exists
set -l home $argv[1]
if not test -e $home
  exit
end

set -l themes 'Everforest-Dark-BL' 'Gruvbox-Dark-BL' 'Kanagawa-BL' 'Tokyonight-Dark-BL'
set -l themes_path $home/Programs
set -l gtk_themes_path /usr/share/themes

# Delete themes
for theme in $themes
  if test -e /usr/share/themes/$theme
    command rm -r /usr/share/themes/$theme
  end
end
