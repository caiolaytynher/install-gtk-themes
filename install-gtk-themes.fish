#!/bin/fish

# This script should be run with root privileges and with the argument being
# the home folder. We need root privileges because the gtk themes folder is
# protected.

# Check if home folder exists
set -l home $argv[1]
if not test -e $home
  exit
end

# Check for the themes folder
if not test -e $home/Themes
  echo 'Please, clone the custom-themes repo to the Themes folder in your home folder.'
  exit
end

set -l themes_repo 'Everforest-GTK-Theme' 'Gruvbox-GTK-Theme' 'Kanagawa-GKT-Theme' 'Tokyo-Night-GTK-Theme'
set -l themes 'Everforest-Dark-BL' 'Gruvbox-Dark-BL' 'Kanagawa-BL' 'Tokyonight-Dark-BL'

# Copy themes to gtk themes folder
for i in (seq 1 4)
  if not test -e /usr/share/themes/$themes[i]
    command cp -r $home/Themes/$themes_repo[i]/themes/$themes[i] /usr/share/themes
  end
end
