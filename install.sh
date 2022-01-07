# no longer needed, since vim-latex will be installed by plug.vim
# cd ~
# wget https://sourceforge.net/projects/vim-latex/files/releases/vim-latex-1.10.0.tar.gz/download
# mv download vimLatex.tar.gz
# tar xvfz vimLatex.tar.gz
# mv vim-latex-1.10.0 .vim
# rm vimLatex.tar.gz
mkdir -p ~/.vim/autoload/
cd ~/.vim/autoload/
wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cd ~/dotfiles/
call makeLinks.sh
call cloneOthers.sh
cd ~
vim -c ':PlugInstall | quit | quit' # 1st quit from PlugInstall, second for vim itself
echo 'Vim is now configured.'
