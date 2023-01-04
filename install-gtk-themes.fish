#!/bin/fish
# This script should be run with root privileges

set -l themes_repo 'Everforest-GTK-Theme' 'Gruvbox-GTK-Theme' 'Kanagawa-GTK-Theme' 'Tokyo-Night-GTK-Theme'
set -l themes 'Everforest-Dark-BL' 'Gruvbox-Dark-BL' 'Kanagawa-BL' 'Tokyonight-Dark-BL'
set -l themes_path $HOME/Programs
set -l gtk_themes_path /usr/share/themes

if not test -e $HOME/Programs
  mkdir $HOME/Programs
end

# Clone repos
for theme in $themes_repo
  if not test -e $themes_path/$theme
    git clone https://github.com/Fausto-Korpsvart/$theme.git $themes_path
  end
end

# Copy themes to gtk themes folder
for theme in $themes
  if not test -e $gtk_themes_path/$theme
    cp -r $themes_path/$theme $gtk_themes_path
  end
end
