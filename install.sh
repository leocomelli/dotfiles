#!/bin/bash

# check if git was installed
command -v git >/dev/null 2>&1 || { 
	echo >&2 "I require git but it's not installed. Aborting...";
	exit 0;
}

REPO="https://github.com/leocomelli/myenv.git"

# clone repository
git clone --recursive $REPO ~/.myenv

# dotfiles
ln -s ~/.myenv/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.myenv/dotfiles/.gitignore ~/.gitignore
ln -s ~/.myenv/dotfiles/.gemrc ~/.gemrc
ln -s ~/.myenv/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.myenv/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/.myenv/dotfiles/.bashrc ~/.bashrc

if [[ "$OSTYPE" =~ "cygwin" ]]; then
	ln -s ~/.myenv/dotfiles/.minttyrc ~/.minttyrc
	wget --quiet https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O /etc/bash_completion.d/git-completion	
fi

[ -f ~/.myenv/hacks/.git-prompt.sh ] && rm ~/.myenv/hacks/.git-prompt.sh
wget --quiet https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -O ~/.myenv/hacks/.git-prompt.sh

# vim
[ -f /etc/vimrc ] && mv /etc/vimrc /etc/vimrc.backup

ln -s ~/.myenv/vim ~/.vim

ln -s ~/.myenv/vim/.vimrc ~/.vimrc

if [[ "$OSTYPE" =~ "darwin" ]]; then
	mv ~/.myenv/vimfiles/mensch-Powerline.otf ~/Library/Fonts
fi

vim +BundleInstall +qall

#bashmarks
git clone https://github.com/huyng/bashmarks.git ~/.bashmarks
cd ~/.bashmarks && make install
rm -Rf ~/.bashmarks

echo "Done! \o/"