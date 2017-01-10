SHELL := /bin/bash

install: install-bash install-vim install-powerline

clean:
	rm -rf ~/.bash
	rm -rf ~/.dotfiles
	rm -rf ~/.bashrc
	rm -rf ~/.bash_profile

	rm -rf ~/.gemrc
	rm -rf ~/.tmux.conf
	rm -rf ~/.minttyrc
	rm -rf ~/.gitconfig
	rm -rf ~/.gitignore
	rm -rf ~/.vimrc
	rm -rf ~/.vim

install-bash:
	cp -rf `pwd`/bash ~/.bash
	cp -rf `pwd`/dotfiles ~/.dotfiles
	ln -s ~/.dotfiles/.bashrc ~/.bashrc
	ln -s ~/.dotfiles/.bash_profile ~/.bash_profile

	ln -s ~/.dotfiles/.gemrc ~/.gemrc
	ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
	ln -s ~/.dotfiles/.minttyrc ~/.minttyrc
	ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
	ln -s ~/.dotfiles/.gitignore ~/.gitignore

	source ~/.bash_profile

install-vim:
	rm -rf ~/.vim
	cp -Rf `pwd`/vim ~/.vim
	ln -s ~/.vim/.vimrc ~/.vimrc
	git clone git@github.com:VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +BundleInstall +qall

install-powerline:
	rm -rf ~/.bash/powerline-shell
	git clone git@github.com:banga/powerline-shell.git ~/.bash/powerline-shell
	cd ~/.bash/powerline-shell; python install.py

