" get rid of 5 keystrokes and replace them with <C-s>
" mP save mark to capital P
" ggVG= go to beginning of file(gg) start visual mode (V)
" go to end of file(G) (now everything is selected in visual mode)
" align it (=)
" :%s/\s\+$//e search lines ending with whitespace and replace it with
" nothing. use the e flag to throw no error if none is found
" :w! write and overrride existing file
" `P jump back to mark setted at the beginning
" a return to insert mode after mark
inoremap <C-s> <esc>mPggVG=:%s/\s\+$/\ /e<cr>:w!<cr>`Pa
inoremap <C-q> <Esc>:q<cr>
inoremap <C-l> <Esc>:wq<cr>
" inoremap <esc> <nop> " force yourself to use jk


" fasten editing .vimrc
" note now .vimrc is parted and we use NerdTree
cnoremap rc e ~/dotfiles/rcParts/
" reload on command mode
cnoremap reload source ~/.vimrc
cnoremap nt NERDTreeToggle
inoremap jk <esc>
" other ways to exit than <esc>: <c-c> and <c-]>
" inoremap <M-l> <Esc>:wq<cr>
" idea: remap jj  to esc
inoremap jj <Esc>
" remap jk on command mode
inoremap jk <Esc>:
" remap hh to backspace
inoremap hh <bs>
" remap jj to esc when in command line (in :) mode
cnoremap jj <esc>
" add a function to the command line mode (ie bind fnc to call the Huhu-function
cnoremap fnc call CmAskQuestion()<cr>
" now use this to ask a question


" cnoremap test call CmAskQuestion()<cr>
" ABREVATIONS
" " Note: abbrevations expand only when a non character follows
"       mappings expand everytime!
" :!abbrev ij iundj - abbrevation in insert AND command line mode
" :unabbrev ij . delete abbrevation ij
" :abclear - removes all abbrevations
" :abbrev - show abbrevations
" :noreabbrev - like noremap - no recursive resolution
iabbrev mfg Mit freundlichen Gruessen
iabbrev @@ christian.marquardt11@gmx.de
iabbrev cm Christian Marquardt
iabbrev ssig --- <cr>Christian Marquardt<cr>christian.marquardt11@gmx.de
iabbrev Hi Hallo
iabbrev sgd Sehr geehrte Damen und Herren
iabbrev fnc function!
iabbrev efn endfunction
iabbrev ff =>
iabbrev cc "
iabbrev lg Liebe Grüße
iabbrev vg Viele Grüße
" vims own functionalities
let mapleader = "-"
" use :vsplit for vertical splitting
nnoremap <leader>ev :vsplit $MYVIMRC<cr>GG$<C-W>La
" reload .vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
" `q - return to the exact location of mark q
" append a ; at the end of line using mark q
nnoremap ends mqA;<esc>`q
" viw - select word in visual mode
" a"  - append quatations
" bi  - back to beginning of the word and in insert mode
" lel - move right to put cursor on the first character of the word
" 	move to the end of the word
" 	move right to put cursor on the ending quote
nnoremap ends mqA;<esc>`q
" viw - select word in visual mode
" a"  - append quatations
" bi  - back to beginning of the word and in insert mode
" lel - move right to put cursor on the first character of the word
" 	move to the end of the word
" 	move right to put cursor on the ending quote
" because of noremap vim uses standard functionality of commands and will not
" remap them.
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
" auto insert eqnarray* in.tex files when opened - does not work yet
" autocmd BufNewFile *.tex call ieqn
" help keycodes
" <C-...> control and ...
nnoremap <C-s> :w!<cr>
" get rid of exiting
nnoremap <C-q> :q<cr>
" save and exit
nnoremap <C-l> :wq<cr>
" force quit; <M-...> is Alt and ...
" disabled for now
" nnoremap <M-l> :wq<cr>
" nnoremap jk :
" make a heading:
" Y yank the whole linie
" p paste it adter
" V visual line mode for next line
" r* replace each selected character with *
nnoremap <leader>h YpVr*
" function with abritrary number of arguments
" :verbose map " to  see where the map commands where defined
" ?^==\+$ search backward a line starting with at least two =
" note \+ is ()+ of regular expressions
" \r  - carrage reuturn - starting at line with at least two ==
" :nohlsearch clears the search highlighting from the performed search
" k - move one line up
" v - enter (characterwise) visual mode
" g_ - move to the last non-blank character of the current line
"      don't use $ because $ also selects the newline character
" => delete the last heading line underscored by ==\+
onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
" g_ - move to the last non-blank character in the line
" v - enter visual mode
" k - move one line up
" 0 - move to the first character of the line
" => delete the last heading including the underlined line ==\+
onoremap ah :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>

" unbind ... to dots by Latexsuite (needs to be sourced after latex suite)
" call IMAP('`...', '\ldots', 'tex') - needs to be called in
" .vim/after/ftplugin/tex_macros.vim
" Statusline
" **********
" set statusline=%f         " Path to the file
" set statusline+=\ -\      " Separator
" set statusline+=FileType: " Label
" set statusline+=%y        " Filetype of the file















"


"



"










