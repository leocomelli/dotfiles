#!/usr/bin/env fish

asdf plugin-add nodejs
asdf install nodejs 14.17.5
asdf global nodejs 14.17.5

npm install --global yarn

python3 -m pip install --user --upgrade pynvim

nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
