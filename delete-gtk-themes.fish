#!/bin/fish

# This script should be run with root privileges and with the argument being
# the home folder

# Check if home folder exists
set -l home $argv[1]
if not test -e $home
  exit
end

set -l themes_repo 'Everforest-GTK-Theme' 'Gruvbox-GTK-Theme' 'Kanagawa-GKT-Theme' 'Tokyo-Night-GTK-Theme'
set -l themes 'Everforest-Dark-BL' 'Gruvbox-Dark-BL' 'Kanagawa-BL' 'Tokyonight-Dark-BL'
set -l themes_path $home/Programs
set -l gtk_themes_path /usr/share/themes

# Delete repos
for theme in $themes_repo
  if test -e $themes_path/$theme
    command rm -rf $themes_path/$theme
  end
end

# Delete themes
for theme in $themes
  if test -e $gtk_themes_path/$theme
    command rm -r $themes_path/$theme $gtk_themes_path
  end
end
