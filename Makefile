# http://github.com/mitsuhiko/dotfiles/blob/master/Makefile
# found in https://github.com/sanitz/dotfiles/blob/master/Makefile 
install: init install-vim install-git install-custom-zsh 

init:
	git submodule update --init --recursive
	vim +PluginInstall +qall

update:
	git submodule foreach git pull origin master
	git add .
	git commit -a -m "updated submodules"
	git push origin master

install-vim:
	rm -rf ~/.vim ~/.vimrc
	rm -rf ~/.vim ~/.ideavimrc
	ln -s `pwd`/vim ~/.vim
	ln -s ~/.vim/vimrc ~/.vimrc
	ln -s ~/.vim/ideavimrc ~/.ideavimrc

install-git:
	rm -rf ~/.gitconfig ~/.gitignore_global
	ln -s `pwd`/git/gitconfig ~/.gitconfig
	ln -s `pwd`/git/gitignore_global ~/.gitignore_global

install-zsh:
	git submodule update --init --recursive
	rm -rf ~/.zshrc ~/.oh-my-zsh ~/.zsh ~/.zprofile
	ln -s `pwd`/zshrc ~/.zshrc
	ln -s `pwd`/oh-my-zsh ~/.oh-my-zsh
	ln -s `pwd`/zsh ~/.zsh
	ln -s `pwd`/zprofile ~/.zprofile

install-custom-zsh: install-zsh
	rm -rf `pwd`/oh-my-zsh/custom/* # remove placeholder files
	ln -s `pwd`/zsh/custom/* `pwd`/oh-my-zsh/custom/ # install custom plugins
