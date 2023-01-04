#!/bin/fish

# This script should be run with root privileges and with the argument being
# the home folder

set -l home $argv[1]
if not test -e $home
  exit
end

set -l themes_repo 'Everforest-GTK-Theme' 'Gruvbox-GTK-Theme' 'Kanagawa-GKT-Theme' 'Tokyo-Night-GTK-Theme'
set -l themes 'Everforest-Dark-BL' 'Gruvbox-Dark-BL' 'Kanagawa-BL' 'Tokyonight-Dark-BL'
set -l themes_path $home/Programs
set -l gtk_themes_path /usr/share/themes

if not test -e $home/Programs
  command mkdir $home/Programs
end

# Clone or update repos
for theme in $themes_repo
  if test -e $themes_path/$theme
    command git -C $themes_path/$theme pull
  else
    command git -C $themes_path clone https://github.com/Fausto-Korpsvart/$theme.git
  end
end

# Copy themes to gtk themes folder
for theme in $themes
  if not test -e $gtk_themes_path/$theme
    command cp -r $themes_path/$theme $gtk_themes_path
  end
end
