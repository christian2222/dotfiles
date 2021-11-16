"call Plugins
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'mattn/emmet-vim'
Plug 'vim-syntastic/syntastic'
Plug 'dense-analysis/ale'
call plug#end()
" ImPORTANT: run :PlugInstall after changing something!
"set nocompatible
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on " IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*


" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" add php coding standards
" Syntastic
let g:syntastic_php_checkers=['php', 'phpcs']
let g:syntastic_php_phpcs_args='--standard=PSR2 -n'

"javascript development
let g:ale_linters = {
\   'javascript': ['standard'],
\}
let g:ale_fixers = {'javascript': ['standard']}
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

" set number
set number
" set relativenumber
:set relativenumber
" evening colorscheme
colorscheme evening
" hlsearch highlights all matches when you search
" incsearch higlight the text while you are typing
set hlsearch incsearch
" no ignore case by search
set noignorecase
" show current position in bottom line
set ruler
" highlight tabs and trailing spaces
set listchars=tab:>-,trail:┐
set list"
" make vim and tmux work together
" set term=xterm-256color
" if &term =~ '^screen'
" tmux will send xterm-style keys when its xterm-keys option is on
"     execute "set <xUp>=\e[1;*A"
"     execute "set <xDown>=\e[1;*B"
"     execute "set <xRight>=\e[1;*C"
"     execute "set <xLeft>=\e[1;*D"
" endif
" INSERT-mode
" ***********

