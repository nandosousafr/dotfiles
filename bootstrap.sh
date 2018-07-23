#!/usr/bin/env bash

cd "$HOME";

sudo apt-get install git-core vim ctags zsh vim-gnome

# General settings
git config --global core.editor /usr/bin/vim

echo "Cloning nandosousafr/dotfiles..."
git clone https://github.com/nandosousafr/dotfiles.git;

echo "Setting up...";
ln -s dotfiles/dotvim .vim;
ln -s dotfiles/vimrc .vimrc;
ln -s dotfiles/.tmux.conf .tmux.conf;
ln -s dotfiles/.gitignore_global .gitignore_global;

git config --global core.excludesfile ~/.gitignore_global;

echo "Fetching neobundle...";

curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh;

echo "Installing vim plugins";
vim +NeoBundleInstall +qall
