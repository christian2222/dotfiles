# s symbolic link r relative to current position
# ln -sr target(file) linkname
ln -sr .vimrc ~/.vimrc
ln -sr .vrapperrc ~/.vrapperrc
ln -sr .emacs ~/.emacs
ln -sr .bash_aliases ~/.bash_aliases
ln -sr .tmux.conf ~/.tmux.conf
# we can also stow outside of the homedirectory
# stow -nv dotfiles/
# -n makes no changes to the file system
# -v tells what would have be done
