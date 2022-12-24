# do not touch .vimrc because it could exist already
# touch ~/.vimrc 
# ATTENTION: only if it not exists
# mkdir -p no error if existing, make parent directory as needed
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "Installation done. Plugin commands are already in .vimrc!"
# note: git repositories in VimPlug only contain location and name!
# Hence: Plug 'mattn/emmet-vim'


# Two possibilities to install Plugins listed in .vimrc
#1) launch vim and run :PlugInstall
#2) vim +PlugInstall +qall # from commandline
# so use 2) to install all plugins in .vimrc
vim +PlugInstall +qall
#Note: :PlugStatus inside vim shows all Plugins from your .vimrc
#	Use :Plug<Tab> for autocompletion
echo "Plugins successfully installed."
