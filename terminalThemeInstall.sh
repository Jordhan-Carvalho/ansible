#!/bin/bash
# clone the repo into "$HOME/src/gogh"
gogh_dir="${HOME}/gogh"

# if [[ ! -d "$gogh_dir" ]]; then
# fi
# if there is a gogh directory, remove it
if [[ -d "$gogh_dir" ]]; then
    rm -rf "$gogh_dir"
fi

mkdir -p "$gogh_dir"

cd "$HOME/gogh"
git clone https://github.com/Gogh-Co/Gogh.git gogh

# necessary in the Gnome terminal on ubuntu
export TERMINAL=gnome-terminal

# Enter themes dir
cd "$gogh_dir/gogh/themes"

# install themes
./dark-pastel.sh
./gruvbox.sh
./gruvbox-dark.sh
./dracula.sh
