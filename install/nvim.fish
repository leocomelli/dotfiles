#!/usr/bin/env fish

# Vim plugin manager
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/plugged/Vundle.vim

asdf plugin-add nodejs
asdf install nodejs 14.17.5
asdf global nodejs 14.17.5
npm install --global yarn

# python3 -m pip install --user --upgrade pynvim

# nvim +PluginInstall +call coc#util#install() +CocInstall coc-snippets +qall

# $SHELL -c cd ~/.vim/plugged/coc.nvim/ && yarn install

