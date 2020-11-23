"call Plugins
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'mattn/emmet-vim'
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
" some latex stuff
augroup LatexStuff
	" remove previously defined autocommands, so they are not loaded
	" multiply times (cannot be placed in the smae line sinde autocmd! is
	" a vimscript command!
	autocmd!
	autocmd FileType tex inoremap dthm <Bslash>begin{thm}<CR><CR><Bslash>end{thm}<Up>
	autocmd FileType tex inoremap ddef <Bslash>begin{defi}<CR><CR><Bslash>end{defi}<Up>
	autocmd FileType tex inoremap dlem <Bslash>begin{lem}<CR><CR><Bslash>end{lem}<Up>
	autocmd FileType tex inoremap dkor <Bslash>begin{kor}<CR><CR><Bslash>end{kor}<Up>
	autocmd FileType tex inoremap dpro <Bslash>begin{proof}<CR><CR><Bslash>end{proof}<Up>
	autocmd FileType tex inoremap ddoc <Bslash>documentclass{article}<CR><Bslash>begin{document}<CR><CR><Bslash>end{document}<Up>
	autocmd FileType tex inoremap öö <bslash>
	autocmd FileType tex inoremap mP <Bslash>mathbb{P}()<left>
	autocmd FileType tex inoremap mA <Bslash>mathbb{A}()<left>
	autocmd FileType tex inoremap wraum Wahrscheinlichkeitsraum
	autocmd FileType tex inoremap mraum Ma<bslash>ss raum
	autocmd FileType tex inoremap djoin <bslash>uplus
	autocmd FileType tex inoremap sohne <bslash>setminus
	" see :help keycodes 
	" for more information about keystroke-coding
	autocmd FileType tex inoremap binfty \bigcup_{i=1}^\infty
	autocmd FileType tex inoremap banfty \bigcap_{i=1}^\infty
	autocmd FileType tex inoremap jinfty \bigcup_{j=1}^\infty
	autocmd FileType tex inoremap janfty \bigcap_{j=1}^\infty
	autocmd FileType tex inoremap NN \mathbb{N}
	autocmd FileType tex inoremap EW \E{}<left>
	autocmd FileType tex inoremap PR \Pr{}<left>
	autocmd FileType tex inoremap ZV Zufallsvariable
	autocmd FileType tex inoremap WK Wahrscheinnlichkeit
	autocmd FileType tex inoremap EAF \sum_{k=1}^n (-1)^{k+1} \sum_{I \subseteq \{1,\ldots,n\},#I=k} \mathbb{P}(\bigcap_{i \in I} A_i)
	autocmd FileType tex inoremap * \cdot 
	autocmd FileType tex inoremap .. \ldots 
	autocmd FileType tex inoremap frc <Bslash>frac{}{}<Left><Left><Left>
	autocmd FileType tex inoremap 1/ <Bslash>frac{1}{}<Left>
	autocmd FileType tex inoremap eps \epsilon
	autocmd FileType tex inoremap eqn <Bslash>begin{eqnarray*}<CR><CR><Bslash>end{eqnarray*}<Up>
	" some other shortcuts
	autocmd FileType tex inoremap FR <Bslash>begin{flushright}<cr><cr><Bslash>end{flushright}<Up>
	autocmd FileType tex inoremap Frame \begin{frame}<CR>\frametitle{<++>}<CR><++><CR>\end{frame}<Up><Up><Up><C-j>
	autocmd FileType tex inoremap Box \mbox{<Space><Space><Space>}<left><left><left>
	autocmd FileType tex inoremap stc \stackrel{}{<++>}<++><left><left><left><left><left><left><left><left><left><left><left>
	" Note: Ctrl-i stirke here
	autocmd FileType tex inoremap <C-i> <Esc>i {\em <Esc>ww<left>i}<Esc>i<right><right>
	" compilation shorcuts from normal mode
	autocmd FileType tex noremap <C-c> <Bslash>ll<CR>
	autocmd FileType tex noremap <C-v> <Bslash>lv<CR>
	" make commands also availible from input mode
	autocmd FileType tex inoremap <C-c> <Esc><Bslash>ll<CR>i<Right>
	autocmd FileType tex inoremap <C-v> <Esc><Bslash>lv<CR>i<Right>
augroup end
" get rid of 5 keystrokes and replace them with <C-s>
inoremap <C-s> <esc>:w!<cr>a
inoremap <C-q> <Esc>:q<cr>
inoremap <C-l> <Esc>:wq<cr>
" inoremap <esc> <nop> " force yourself to use jk 
" some bash shortcuts
" Skripting Stuff
augroup SkriptStuff
	autocmd!
	autocmd FileType sh inoremap ati apt-get install<Space>
	autocmd FileType sh inoremap SHE #!/bin/bash
augroup end

augroup PhpStuff
	autocmd!
	autocmd FileType php inoremap vd var_dump($);<Left><Left>
	autocmd FileType php inoremap PHP <?php<cr><cr>?><Up>
	" note: after <Esc> reenter insert mode with A not with <A>!
	autocmd FileType php inoremap ifn private function () {<cr>}<Up><Esc>A<Esc><Left><Left><Left><Left>a
	autocmd FileType php inoremap ofn protected function () {<cr>}<Up><Esc>A<Esc><Left><Left><Left><Left>a
	autocmd FileType php inoremap pfn public function () {<cr>}<Up><Esc>A<Esc><Left><Left><Left><Left>a
	autocmd FileType php inoremap cstr public function __construct(){<cr>}<Up><Esc>A<Esc><Left>i
	autocmd FileType php inoremap Est echo '';<Left><Left>
	autocmd FileType php inoremap dd $
	autocmd FileType php inoremap this $this
	autocmd FileType php inoremap -- ->
	autocmd FileType php inoremap ebr echo '<br>';
	autocmd FileType php inoremap ehl echo '<br><hl><br>';
	autocmd FileType php inoremap Get $_GET[''];<Left><Left><Left>
	autocmd FileType php inoremap Test /**<cr>@test<cr>*/<cr>public function () {<cr><cr>}<Up><Up><Esc>A<Esc><Left><Left><Left>i
	autocmd FileType php inoremap PAR @param 
	autocmd FileType php inoremap RET @return 
augroup end

augroup HtmlStuff
	autocmd!
	" read a skeleton for a new file -- see :help skeleton
	" stack autocmds to execute them one after another, however it's cleaner to call a function
	autocmd BufNewFile *.html	0r ~/dotfiles/skeletons/skeleton.html
	autocmd BufNewFile *.html	call IMAP_Jumpfunc('', 0) " call IMAP_JumpForward() instead of <C-j> which is binded to this fundtion
	" for more information see :map and look for IMAP-JumpForward
	autocmd FileType html inoremap Html <html><cr><head><cr></head><cr><body><cr></body><cr></html>
	autocmd FileType html inoremap dic <div class=""><cr><cr></div><cr><Up><Up><Up><Esc>A<Esc><Left>i
augroup end


augroup JavaStuff
	autocmd!
	autocmd FileType java setlocal omnifunc=javacomplete#Complete
	autocmd FileType java nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
	autocmd FileType java imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
	autocmd FileType java nmap <F5> <Plug>(JavaComplete-Imports-Add)
	autocmd FileType java imap <F5> <Plug>(JavaComplete-Imports-Add)
	autocmd FileType java nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
	autocmd FileType java imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
	autocmd FileType java nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
	autocmd FileType java imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
	" Default mappings
	autocmd FileType java nmap <leader>jI <Plug>(JavaComplete-Imports-AddMissing)
	autocmd FileType java nmap <leader>jR <Plug>(JavaComplete-Imports-RemoveUnused)
	autocmd FileType java nmap <leader>ji <Plug>(JavaComplete-Imports-AddSmart)
	autocmd FileType java nmap <leader>jii <Plug>(JavaComplete-Imports-Add)
	autocmd FileType java imap <C-j>I <Plug>(JavaComplete-Imports-AddMissing)
	autocmd FileType java imap <C-j>R <Plug>(JavaComplete-Imports-RemoveUnused)
	autocmd FileType java imap <C-j>i <Plug>(JavaComplete-Imports-AddSmart)
	autocmd FileType java imap <C-j>ii <Plug>(JavaComplete-Imports-Add)
	autocmd FileType java nmap <leader>jM <Plug>(JavaComplete-Generate-AbstractMethods)
	autocmd FileType java imap <C-j>jM <Plug>(JavaComplete-Generate-AbstractMethods)
	autocmd FileType java nmap <leader>jA <Plug>(JavaComplete-Generate-Accessors)
	autocmd FileType java nmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
	autocmd FileType java nmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
	autocmd FileType java nmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)
	autocmd FileType java nmap <leader>jts <Plug>(JavaComplete-Generate-ToString)
	autocmd FileType java nmap <leader>jeq <Plug>(JavaComplete-Generate-EqualsAndHashCode)
	autocmd FileType java nmap <leader>jc <Plug>(JavaComplete-Generate-Constructor)
	autocmd FileType java nmap <leader>jcc <Plug>(JavaComplete-Generate-DefaultConstructor)
	autocmd FileType java imap <C-j>s <Plug>(JavaComplete-Generate-AccessorSetter)
	autocmd FileType java imap <C-j>g <Plug>(JavaComplete-Generate-AccessorGetter)
	autocmd FileType java imap <C-j>a <Plug>(JavaComplete-Generate-AccessorSetterGetter)
	autocmd FileType java vmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
	autocmd FileType java vmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
	autocmd FileType java vmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)
	autocmd FileType java nmap <silent> <buffer> <leader>jn <Plug>(JavaComplete-Generate-NewClass)
	autocmd FileType java nmap <silent> <buffer> <leader>jN <Plug>(JavaComplete-Generate-ClassInFile)
augroup end

" fasten editing .vimrc
cnoremap rc e ~/.vimrc
" reload on command line
cnoremap reload source ~/.vimrc
inoremap jk <esc>
" other ways to exit than <esc>: <c-c> and <c-]>
" inoremap <M-l> <Esc>:wq<cr>
" idea: remap jj  to esc
inoremap jj <Esc>
" remap jk to command line
inoremap jk <Esc>:
" remap hh to backspace
inoremap hh <bs>
" remap jj to esc when in command line (in :) mode
cnoremap jj <esc>
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
nnoremap jk :
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

" VIMSCRIPT
" *********
"" options
" set textwidth=80 - sets the options
" echo &textwidth - shows the option
" & means option for vim not variable
" boolean options (i.e set (no)wrap ) are translated to 0 and 1
" => non-zero integer is true, 0 is false
" let &textwidth = &textwidth + 10
" set textwidth = 40
" => set allows only a fixed value, but no formulas!
" let &l:<varName> = 5 - sets a variable local for one buffer
" let &b:<varName> = 5 - is the same scoped variable, scoped to one buffer
" idea: use registers as variables, ie. let @a = "hello"
" type "ap to paste the hello where you are
" @" last selected text in visual mode
" @/ last searchword
" yxy yank x lines
" "gy8y yank 8 lines in register g
" press "gp in normal mode to insert them again.
" type :help reg for more information
" note: vimscript is not dynamically typed
"" variables
" let foo = "bar" " - sets the variable foo to the string "bar"
" let foo = 42 - sets foo to integer 42
" vimscript is by defualt case sensitive, to change this use set ignorecase,
" but this is an option! Don't use it!!!
" ==? - case-insensitive comparsion
" ==# - case-sensitive comparsion
" => use case sensitive comparsion even when comparin integers
" :call Huhu() - calls the function; functions must! start with a capital
" letter
function Huhu()
	echo "Hallo Christian"
endfunction
" :echo ReturnMe() - prints the return value
function ReturnMe()
	return "Einne schönen guten Tag!"
endfunction
" remind call thorws away the return value, so the correct usage is
function Use()
	call Huhu()
	echo ReturnMe()
endfunction
" ! - override the function (needed if you replace something)
function! DisplayName(name)
	echo "Hello, your name is:"
	"a: tells vim that the variable is in argument scope
	echo a:name
endfunction
function! MuchArgs(foo,...)
	" don't reassign parameters
	" a:foo = "hello" won't work
	" => no parameters at the righthandside of an assignment
	echo a:foo
	" number of arguments
	echo a:0
	" first argument
	echo a:1
	" echo a:2
	" list of all arguments; attention: don't use echom with lists!
	echo a:000
endfunction
function! Numbers()
	" digital system
	echo 100 	
	" hexadecimal system
	echo 0xbeef
	" starting with 0 means octal!-system
	echo 057
	" expect it's not octal at all
	echo 099 
	" floats
	echo 100.5
	echo 5.45e+3
	echo 7893.45e-2
	echo 5.4547463e2
	echo 2/3
	echo 2/3.0
	" Strings
	echo "2 Hello "+"3 world!"
	echo 10 + "10.10"
	echo "Hello " . "world!"
	echo 10 . "foo"
	" echo 10.1 . "foo"  - throws an error since vim != Javascript
	" to translate between different types use functions!
	" special chars
	echo "Hello \\ \n \"World\""
	" ' tells vim to take the string as it is without escape sequences
	" called literal string
	echo '\n\\'
	" only existing escape sequence is ''
	echo 'Thats''s enough.'
	" string-lengths
	echo strlen("hello")
	echo len("hello")
	" splits
	echo split(" one two three")
	echo split("one, two, three", ",")
	" joining
	echo join(["Hello","World"],"...")
	" combine
	echo join(split("Hello Wolrd"),"-")
	" lower and upper case
	echo tolower("HelLO")
	echo toupper("wOrLd")
endfunction
" idea: use tolower before comparsion to perform case-insensetive comparsions
" execute "normal! gg/foo\<cr>dd" - go to top of file find first foo and
" delete that line
" attention: only normal! won't work because of <cr>
" execute "normal! mqA;\<esc>`q"
" mq - stores the current location to mark q
" A - move to end of line and start insert mode after last character
" ; - type an semicolon
" \<esc> - "hit" escape
" :execute "normal! gg/print<cr>n" searches first print in file
" :execute "normal! G?print<cr>" searches last print in file
" note / is forward ? backward search
" execute takes a string, => double backslahshes turn into single ones as we
" get to normal!
" Vim has four! different modes parsing regular expressions. Default mode
" requires a backslash before the + character
" in direct search mode enter: /print .\+
" => double backslashes only used because we were passing the pattern as a
" string to execute
" :execute "normal! gg/for .\\+ in .\\+:\<cr>"
" using literal strings (passing through characters direectly)  we can rewrite the execute statement to
" :execute "normal! gg" . '/for .\+ in .\+:' . "\<cr>"
" because '<cr>' would not be evaluated to return
" idea: start the regular expression to search for with '/\v<searchterm>'
" leads you to a Very magic but in other languages normal regular expression
" mode
"	nnoremap <leader>g :execute "grep! -R " . shellescape(expand("<cWORD>")) ." ."<cr>:copen<cr>
" <cword> stands for word under cursor when running the command
" <cWORD> get a WORD (with - special charater in it) instead of a word 
" (without  special chars)
" without the quotations of '<cWORD>' a search term like foo;ls will be
" searched for foo and then the ls command will be executed after!
" with the quotations its also much more robust
" now "that's" won't work, so we use shellescape to escapse all special chars
" in cWORD
" but now vim escapes "<cWORD>"  before! passing the actual string
" see :echo shellescape(<cWORD>)
" idea: use the expand() function before passing to shellescape.
" Note: /\c searches with ignored case; /\C searches case-sensitive
" 2/<pattern> searches the first 2 occurences of the pattern
" that's
" BUG: grepping the word "for" opens a tex file. FIXED: by grep!
" grep! dont go to the first result automatically
" :copen<cr> - open the quickfix window to do the job.
" use ...<leader>g :silent execute ... to surpress searching, but since
" searching takes a long time we won't do that now.
" silent would supress any output of the grep command
" hopefully temporarely comment out the <leader>g mapping
" abort grepping because it does not work yet!
" Lists
" *****
" lists are zero indexed
" -1 is the index of last element, -2 the index of the secaond last element etc...
function! ListExample()
	echo ['foo', 3, 'bar']
	echo ['foo', [3, 'bar']]
	echo [0, [1, 2]][1]
	echo [0, [1, 2]][-2]
	echo ['a', 'b', 'c', 'd', 'e'][0:2]
	echo ['a', 'b', 'c', 'd', 'e'][0:100000]
	echo ['a', 'b', 'c', 'd', 'e'][-2:-1]
	echo ['a', 'b', 'c', 'd', 'e'][:1]
	echo ['a', 'b', 'c', 'd', 'e'][3:]
	" indesind strings too
	echo "abcd"[0:2]
	echo "abcd"[0:2]
	echo "abcd"[-1] . "abcd"[-2:]
	" concatenation
	echo ['a', 'b'] + ['c']
	let foo = ['a']
	call add(foo, 'b')
	echo foo
	echo len(foo)
	echo get(foo, 0, 'default')
	echo get(foo, 100, 'default')
	echo index(foo, 'b')
	echo index(foo, 'nope')
	echo join(foo)
	echo join(foo, '---')
	echo join([1, 2, 3], '')
	call reverse(foo)
	echo foo
	call reverse(foo)
	echo foo
endfunction

function! Loops()
	let c = 0

	for i in [1, 2, 3, 4]
		let c += i
	endfor

	echo c

	let c = 1
	let total = 0
	" no equivalent for loops like for (int i = 0; i < foo; i++)
	while c <= 4
		let total += c
		let c += 1
	endwhile

	echo total

endfunction

" dictionaries
" ************
" similar to javascript objects
" created using curly brackets
" echo {'a': 1, 100: 'foo',}
" always use the trailing comma => adding new entries has less errors
" :echo {'a': 1, 100: 'foo',}['a']
" Note: vim translates the keys to strings before the lookup 
" because keys can only ever be strings
" Javascriptstyle of dot-lookup only for key of digits, letters and
" underscores
" :echo {'a': 1, 100: 'foo',}.a
" :echo {'a': 1, 100: 'foo',}.100
" 
function! Dictionaries()
	" adding and assigning entries works the same way
	:let foo = {'a': 1}
	:let foo.a = 100
	:let foo.b = 200
	:echo foo
	" two ways of removing elements; remove returns the value
	" => use remove
	let test = remove(foo, 'a')
	unlet foo.b
	echo foo
	echo test
	" unlet foo["asdf"] - throws an error because the key doesn't exist
	" dictionary functions
	echo get({'a': 100}, 'a', 'default')
	echo get({'a': 100}, 'b', 'default')
	echo has_key({'a': 100}, 'a')
	echo has_key({'a': 100}, 'b')
	" items returns all elements but in no! specific order
	:echo items({'a': 100, 'b': 200})
	:echo keys({'a': 100, 'b': 200})
	:echo values({'a': 100, 'b': 200})

endfunction

" Toggling
" ********
" set someoption! - toggles the specific option if its boolean
nnoremap <leader>N :setlocal number!<cr>
" toggling more complex options
nnoremap <leader>f :call FoldColumnToggle()<cr>

function! FoldColumnToggle()
	if &foldcolumn
		setlocal foldcolumn=0
	else
		setlocal foldcolumn=4
	endif
endfunction

" toggle the quickfic-window
nnoremap <leader>q :call QuickfixToggle()<cr>
" define a global variable
let g:quickfix_is_open = 0

function! QuickfixToggle()
	if g:quickfix_is_open
		cclose
		let g:quickfix_is_open = 0
		execute g:quickfix_return_to_window . "wincmd w"
		" see :help wincmd
	else
		let g:quickfix_return_to_window = winnr()
		" see help winnr
		copen
		let g:quickfix_is_open = 1
	endif
endfunction
" Getting something that works most of the time (and doesn't explode when it doesn't work) and getting back to coding is usually better than spending hours getting it 100% perfect. The exception is when you're writing a plugin you expect many people to use. In that case it's best to spend the time and make it bulletproof to keep your users happy and reduce bug reports.
" Paths
" *****
function! Paths()
	" % - current file,ie. source %
	" => print relative path to file
	echo expand('%')
	" full absolute path
	echo expand('%:p')
	" absolute path to foo.txt in actual directory
	" => fnamemodify is more flecible than expand
	echo fnamemodify('foo.txt', ':p')
	" list all files in current directory
	echo globpath('.', '*')
	" make a list out of it
	echo split(globpath('.', '*'), '\n')
	" all *.txt files in current directory
	echo split(globpath('.', '*.txt'), '\n')
	" recursively list files
	echo split(globpath('.', '**'), '\n')
endfunction

" functional vim
" **************
function! Sorted(l)
	let new_list = deepcopy(a:l)
	call sort(new_list)
	return new_list
endfunction

function! TestIt()
	echo Sorted([3,2,4,1])
endfunction

function! Reversed(l)
	let new_list = deepcopy(a:l)
	call reverse(new_list)
	return new_list
endfunction

function! Append(l, val)
	let new_list = deepcopy(a:l)
	call add(new_list, a:val)
	return new_list
endfunction
" replace element in list
function! Assoc(l, i, val)
	let new_list = deepcopy(a:l)
	let new_list[a:i] = a:val
	return new_list
endfunction
" return and remove element at index i
function! Pop(l, i)
	let new_list = deepcopy(a:l)
	call remove(new_list, a:i)
	return new_list
endfunction
" store functions in variables
let MyFunc = function("Append")
let funcs = [function("Append"), function("Pop")]
" echo funcs[1](['a', 'b', 'c'], 1)
" higher-order functions take functions and do something with them
" fn is called funcref in vim
function! Mapped(fn, l)
	let new_list = deepcopy(a:l)
	"          <list>,  function!-string, at what
	call map(new_list, string(a:fn) . '(v:val)')
	return new_list
endfunction
" Example: 
" call map(mylist, '"> " . v:val . " <"')
" This puts "> " before and " <" after each item in "mylist".
function! Filtered(fn, l)
	let new_list = deepcopy(a:l)
	" usse the "command" function(value)
	call filter(new_list, string(a:fn) . '(v:val)')
	return new_list
endfunction

function! Removed(fn, l)
	let new_list = deepcopy(a:l)
	" ! negates the result
	call filter(new_list, '!' . string(a:fn) . '(v:val)')
	return new_list
endfunction


function! TestMappedAndFilter()
	let mylist = [[1, 2], [3, 4]]
	echo Mapped(function("Reversed"), mylist)
	let mylist = [[1, 2], [], ['foo'], []]
	echo Filtered(function('len'), mylist)
	let mylist = [[1, 2], [], ['foo'], []]
	echo Removed(function('len'), mylist)
endfunction


" DOCUMENTATION
" *************


" encryption
" **********
" vim -x file.one - encrypt file.one with entered encryption key
" :set key= - kill encryption on current file
" vim .x -n file.one - encrypt file.one without swapfile because swapfiles are
" not encrypted!
" :setlocal noswapfile - diables the swapfile
" remind: encryption of vim is not very good

" Moving around
" *************
" A - insert mode at the end of the line
" I - insert mode after moving cursor to first non-blank character
" J - join the current line and the line below
" u - undo the last change
" ctrl-r redo last change
" U - undo the complete line change
" a - append text after the acutal cursor
" x - delete the char under the cursor
" X - Backspace
" o - opens a new line below cursor and puts vim in insert mode
" O - opens a new line above cursor and puts vim in insert mode!!!
" 3a! - adds 3 ! after the cursor
" w - start of next word
" b - start of previous word
" 3w - move 3 words forward
" 2b - move 2 words backward
" e - move to next end of a word
" ge - move to previous end of word
" 9k - move 9 lines up
" 3A<pattern> - add 3 times the pattern at the end of line
" 3x - delete 3 characters
" ZZ - write the file and exit (no backup file is created - can be changed
" B,W,E - like b,w,e but with special chars in word
" $ - move cursor to end of line, so A=$a
" ^ - move to first non-blank character of line
" 0 - move to the very first character of a line
" excercise: find out the difference between ^ and 0
" in this example " 3$ does not make sence but works 
" " 0 takes no count because 0 is 0 
" " 3^ has no effect on ^
" fx - searches foward to next character x (try it in this line with 2s)
" Fx - searches the line backwards for x (try it here with 3Fe)
" tx - like fx, but stops before the character; t stands for "to"
" Tx - same thing backwards
" these 4 commands can be repeated with ;
" , repeats in the other direction
" but the cursor is never moved to another line
" f<esc>,F<esc> -abort the search
" % - move to the matching braces ((){}[]) or find one
" 33G - puts you to absolute line number 33
" G - end of file
" gg - start of file
" 40% - moves you to 40% of the file
" 3j3k4l5h - work the same with relative movement
" H,M,L - moves you to the home,middle and last line you see
"

" File commands
" *************
" :q! - quit without saving
" : -command line mode
" q - quit the file
" ! - force to quit
":e! - reload the original version of the current file
"

" Mappings
" ********
" vnoremap _g y:exe "grep /" . escape(@", '\\/') . "/ *.c *.h"<CR> - yanks the visually selected text and searches for it in C files
" map Q gq - a mapping
" map <F5> i{<Esc>ea}<Esc> - set braces arounnd one word
" map \p i(<Esc>ea)<Esc> - using backslash (has no function in vim)
" map \c i{<Esc>ea}<Esc>
" map - list all current mappings
" remind: difference between iabbrev and imap
"

" Help files
" **********
" :help deleting - how to delete text
" :help index - index of all vim commands
" :help ctrl-a - help for ctrl-a
" note: help always displayed for normal mode
" :help i_ctrl-h - help for ctrl-h in insert mode
" :help -t
" :help 'number' - help for option number
" :help-summary - help with all options
" :help i <up> - help for the up-key in insert mode
" :help E37 - help on error 37
" :help num<ctrl-d> - list all help topics starting with num
" :help num<tab> - cycle through this list
" :help helphelp - help on help
" :help pattern.txt
" :help options.txt
" :help cpo-<letter> - help to coption letter flag
" :help go-<letter> - help to guioption letter flag
" :help gt - help for gt in normal mode
" :help i_ctrl-w - help for ctrl-w in insert mode
" :help v_o - help for o in visual mode
" :help c_% - help for % in command line mode
" :help :s - ex command help for s
" :help >cont - help for debug mode cont
" :help i_ctrl-x - help for autocompletion
" :help ctrl-w - help for ctrl-w in normal mode
" :help pattern.txt - help for regular expressions
" :help quote: - help for register q, since registers always start with "
" :help eval.txt - vimscript help
" :help expr-! - vimscipt help for not
" :help function-list - short description of all functions
" :help append() - help for (vimL) function append
" :help mapmode-i - help for imap
" :help map.txt
" :help :map-local - buffer local mappings
" :help map-bar - how | is handled in mappings
" :h command-topic - command definitions
" :h command-bar - ! argument for custom commands
" :help usr-toc.txt - user manual
" :help usr_24.txt - chapter 24 of user manual
" :help 10.1 - go to chapter 10.1 in usr_10.txt
" :helpgrep topic - grep all helpfiles for a specific topic and takes you to
" :help - get help
" cttrl-] - follow a link (under the cursor) in the vim help 
" ctrl-t,ctrl-o - jump back from/to last link
" <ctrl+altgr+]> - follow links in help
" :help x - help to deleting chars
" :help recovery
" :help swapfile
" :h add-filetype-plugin
" :h load-plugins
" :h write-plugin
" :h vimrc-filetype
" :h option-list
" :h oldfiles
" :h sessionoptions
" :h modeline
" :h mewtr-browse - for more information on file browser
" :h -f - help on command line switch f
" :h +conceal - help on optional feature conceal
" :h :help BufWinLeave - autocomands by their name
" :help autocommands-events
" :help ft-c-syntax - filetype specific c syntax
" :h ft-php-omni - omnicompletion in php
" :h ft-tex-plugin - tex plugin informations
" :h W10 - help on warning 10: Changing a readonly file
" :h E128 - takes you to function, because there the error occurs
" see fo-table,joinspaces,formatprg
"

" Deleting
" ********
" d3w - delete the 3 following words
" d2e - exclusive delete two words
" d$ - delete til end of line
" note: first type an operator d then a motion $
" d4l - delete 4 chars; also an "operator-motion"
" some shortcuts
" 	x  stands for  dl  (delete character under the cursor)
"	X  stands for  dh  (delete character left of the cursor)
"	D  stands for  d$  (delete to end of the line)
"	C  stands for  c$  (change to end of the line)
"	s  stands for  cl  (change one character)
"	S  stands for  cc  (change a whole line)
" d3w = 3dw expect that 3dw deletes a word 3 times
" 2d3w - deletes 6 words
"

" delete pieces of text
" ---------------------
" x	delete character under the cursor (short for "dl")
" X	delete character before the cursor (short for "dh")
" D	delete from cursor to end of line (short for "d$")
" dw	delete from cursor to next start of word
" db	delete from cursor to previous start of word
" diw	delete word under the cursor (excluding white space)
" daw	delete word under the cursor (including white space)
" dG	delete until the end of the file
" dgg	delete until the start of the file
" use c instead of d for change commands; remind: you can also yank with y
"

" Windows commands
" ****************
" windows commands all start with ctrl-w
" :h ctrl-w_p - help at moving to previous window
" :h windows.txt - general window help
" :copen - opens the quickfix-window where all matches are availible
" :h hl-WaningMsg - WarningMsg highlightgroup
" :h :syn-conceal - help about the conceal argument for syn command
" quickfix commands start with :c and list commands with :l
" move on with :h usr_03.txt
" what vim detects as a word is set in the option 'iskeyword'
" ctrl-g - information where you are in file
" ctrl-u - move 'bild' up half screen
" ctrl-d - move 'bild' down half screen
" :!<cmd> - execute cmd on command line
" ctrl-e/y - scroll one line up or down
" ctrl-f/b - scroll full screen up or down
" zz - center line with cursor in window
" zb/t - cursor at line top or bottom
" the solder holding one of the chips melted and the
" /the$ finds the ar the end of line
" /^the finds the at the begining of line
" /c.m -matches com,cum,cam,...
" to match a real . escape it in search: /\.
" `` - come back to the mark where you came from
" note: ` is a jump itself
"

" Changing
" ********
" c2wbe - change 2 words under cursor and insert be (note: space after is not deleted)
" cc - changes the whole line (here remaped to " )

" Replacing
" *********
" rx - replace character under cursor with x
" 5rx - replaces the 5 following characters with xxxxx
" 4r<enter> - replaces 4 characters with one line break


" Dot command
" ***********
" . - repeat the last change command 
" To <B>generate</B> a table of <B>contents
" f>df>f<.f<. on the line above
" /four<enter>cwfive<esc>n.n. - repeat replacing four with five
"

" Visual mode
" ***********
" velllld - enter visual mode, select til end of word and the first 3 chars of
" the following word and delete the selected text
" Vjj - select 3 lines; V is line selection mode
"  ctrl-v - select a regular block
"  		name		Q1	Q2	Q3
"		pierre		123	455	234
"		john		0	90	39
"		steve		392	63	334
" fQ<ctrl-v>3jwhd - do this on the start of the table
" in visual mode hit o/O for other end of selection
"
" deleted text by d or x can be pasted back by p/P ("put") below/before
" 3p - paste 3 times
" type xp on the e of teh
" welp - 
" D - delete from cursor to end of line
" gv . select the preselected text in visual mode
"

" Visual block mode
" *****************
" <ctrl-V> - enter visual block mode ($ in mode extend to all end of lines)
" 	   - I[string] inserts string in every line of the visual block
" 	   - not if lines are too short!
" 	   - A[string] appends at the right side of the block and! inserts
" 	     text in a short line
" 	   - $A XXX<esc> inserts XXX after each line
" 	   - C changes every line after leaving insert mode
" 	   - ~ swap case
" 	   - u/U make lower/upper case
" 	   - rx replace selected block with xs
" 	   - > shifts selected text right
" 	     :set shiftwidth=4
" 	     << shifts text (whole line) right
" 	   - J join all selected lines together (see 'joinspaces' option)
" 	This is a very huhu
"	short
"	Any other very huhu
"
" gqap - format current paragraph; paragraphs are separated by empty lines
" note: a line with whitespaces is no paragraph separator!
" gggqG - format whole file
" => gq is format
" gqj - format current line and line below
" gu/Uw - change word to lower/upper case
" g~w - toggles word between upper and lower case (works also in visual mode)
" Note: to make an operator work on lines double it
" g~~ - toggle complete line
" :!<system command>
" "![motion][program] - [motion] block is into to external [program]
" !5Gsort<enter> - sort the 5 following lines
" !!date<enter> - replace current line with date (good for timestamps)
" see: 'shell' options
" :read !ls - put current directory content in file
" :0read !date -u - insert the date at beginning of file in utf format
" :write !wc - count word of current file
" 	       output: lines	words	characters
" Attention: :write! wc will write to file wc
" <ctrl-l> - redraw screen (overidden by this vimrc)
" swap files
" :w file.one.recovered
" :edit #
" :diffsp file.one
" if you wrote the changes you can delete the .swp file
" for better recovering use options 'updatetime' and 'updatecount'
" for location use options 'dir' and 'shell'
"

" Copy(=yank) and paste
" ---------------------
" Y=yy - yanks the whole line
" P/p - puts before/atfer cursor
" y2w - yank (=vim's expression for copying) 2 words
" p - put the yanked things
" y$ - yanks til end of line
" Note: yw includes whitespace after word; ye does not
" "xy - yank selected text into register x
" "xp - put/paste selected text from register x
" "xyy - yank whole line into register x
" "*yy - yank into system clipboard (used with other programs)
" "*p - put from system clipboard
" :help clipboard
" "+y$ - yank til end of line to real clipboard
" "+p - insert the real clipboard
" daw - delete a word; with following whitespace
" operator-text objects: (no matter where the cursor is)
" cis - c change is inner sentence 
" cas - includes whitespace after sentence
" das - delete the sentence incl. whitespace
" idea: use text objects in visual mode
" vas - select actual sentence
" :help text-objects
" R - replace mode (overrides characters)
" :h operator
" "vyiw - yank register v to inner word
" "vyiw - yank register v to inner word
"

" appended yanking
" ****************
" "aY - start yanking one line into register a
" "AY - yank another (independent) line into register a
" => register a now contains all lines in yanked order!
"

" Macros
" ******
" qx - start recording to macro-register x (stop again with q)
" @x - replay macro in register x
" qa^i#include "<esc>$a"<esc>jq - record inserting #include "..." to register a
" "ap - paste recorded macro commands (in register a) as text
" 3@a - replay the macro 3 times
" @@ - replay last played macro
" compares with . macros can record more than one change
" reming: you have 26 registers (a-z)
" note: same registers as yank registers
" => qC/<word><enter>q - append a search after what is in register c
"

" Using registers
" ***************
" "fyas - yank a sentence in the f register (a-z are registers) registers
" appear before! the yank command
" "l3Y - yank 3 lines in the l register
" <ctrl-V>jjww"by - yank a block of 2 lines and 2 words to b register
" notice: "b is before! the yanking y
" "fp - paste content of register f where the cursor is
" "wdaw - delete a word and write it in register w (register before! delete)
" "g3dw - delete up to 3 words in register g
"

" Marks
" *****
" mx - set mark x at current position x out of a..z
" `x - move to mark x
" 'x - moves to the begining of the line with mark x
" note: use s and e as marks for begining and end of file
" :marks - to see all marks
" special marks
" '	The cursor position before doing a jump
" "	The cursor position when last editing the file
" [	Start of the last change
" ]	End of the last change
" :'t,'b - using text between the marks t(op) and b(ottom)
" :'<,'> - after visual mode these are actual marks selecting start and end of
" visual selection
" '>,$ - mix these marks with other items!
" 5: - mark the current and the next  lines (and do something)
" :1,5center 40 - formats line 1-5 with textwidth  40
" :1,5right 37
" :1left 5 - in left 5 is the margin

" Jumps
" *****
" ctrl-o - come back from where you started
" ctrl-i - jump forward (again)
" note: ctrl-i=<tab>
" :jumps - lists positions you jumped to
"

" Lower and upper case
" ********************
" ~ - change to upper/lower keys 
" :set tildeop - makes ~ to operator key
"

" vimrc
" *****
" :edit $MYVIMRC - in home directory
" $VIMRUNTIME/vimrc_example.vim - example vimrc file
" autocmd FileType text setlocal textwidth=78 - no longer lines than 78 chars
" in plain text files; only for onr file buffer
" 	autocmd BufReadPost *
"	    \ if line("'\"") > 1 && line("'\"") <= line("$") |
"	    \   exe "normal! g`\"" |
"	    \ endif
" after reading any file check if mark '" exists and jump to it if so
" \ can break a line command (works only in vimscript file)
" :help line-continuation
" 	if &t_Co > 2 || has("gui_running")
"	  syntax on
"	  set hlsearch
"	endif
" if more than 2 colors are availible and gui is running turn syntax
" highlighting on and set hlsearch
" filetype plugin indent on - 1) filetype detection 2) use filetype plugin
" files 3) use indent
" use :runtime! ftplugin/man.vim in your .vimrc
" 	now you can :Man 3 echo to get to section 3 of echo


" Settings and options
" ********************
" :options - list of options
" :set showmatch - show corresponding ) if you type a ( and vice versa
" :set matchtime=15 - wait 1.5 seconds when matching
" :set (no)<option> - (un)sets the specific option
" :set so=0
" :help 'scrolloff'
" :set iskeyword& - sets iskeyword option to default value
" :set nowrap
" :set sidescroll=10
" :set whichwrap=b,s - allows <bs> and <space> to change the line
" :set whichwrap=b,s,<,>,[,] - let <lfet> and yright> do the same thing
" :set list - makes tabs visible
" :set listchars=tab:>-,trail:- - displays tabs as >---
" :set iskeyword+=- - now - is part of a word and no special char any more
" :set cmdheight=3 - sets the height of the command line
" :set ruler - show cursor position on the lower right
" :set a(uto)i(ndent)
" :h option-list
" :syntax enable - color your files by syntax
" :colorscheme evening
" :set fielformats=unix,dos
" :set fileformat? - prints actual file format
" :set (relative)number - shows (relative) numbers on the left
" :set no(relaitive)number - turns this off again
" :set ruler - displays the cursor position in the lower right corner
" :set autoindent - keeps indent from previous line
" :set incsearch - search while typing
" :set nocompatible
" :set history=50 - keep 50 search patterns/commands in mind
" :set ruler - display cursor position in lower right corner
" :set showcmd - display incomplete commands on status line; try with it 2f(w)
" set backspace=indent,eol,start - allows <bs> to delete whitespace at start
" of a line, a line break and character before insert mode
" :set textwidth=30
" :set shiftwidth=4 - change indent witdh
" :set softtabstop<04 - making the <tab> key insert 4 spaces of indent
" see 'expandtab','tabstop'
" :set tabstop=3
" :retab 	 - change tabstop to 8
" :set guioptions+=b - add a horizontal scrollbar
" :set wrap
" :set linebreak
"

" packages and plugins
" ********************
" :packadd! matchit
" :h matchit - after restart
" :h packages
" plugin - vimscript file loaded automatically
"     global plugin: Used for all kinds of files
"   filetype plugin: Only used for a specific type of file
" optional and automatically loaded packages
" :packadd justify - now hit _j in visual mode (not build in!)
"

" Windows and Buffers
" *******************
" <ctrl-w>+/- - in/decrease the current window size
" (height)<ctrl-w>_ . guess what it does (set height to current window)
" The 'winheight' option can be set to a minimal desired height of a window and
"'winminheight' to a hard minimum height.
"   Likewise, there is 'winwidth' for the minimal desired width and
"'winminwidth' for the hard minimum width.
"   The 'equalalways' option, when set, makes Vim equalize the windows sizes
"when a window is closed or opened.
" <ctrl-w>h/j/k/l - move to window left/down/up/right
" <ctrl-w>t/h - move to window Top/Bottom
" :h Q_wi - more command to move to other windows
" <ctrl-w>H/J/K/L - rearrange windows placing the current window left/down/up/top
" differences between files
" :buffers - see all buffers
" :buffer help
"

" Sessions and Views
" ******************
" :h sessionoptions
" views save only one windows not a complete session
" :mkview 1 - make a view called 1 (1-9)
" :loadview 1 - loads view 1
" :mkview main.vim - save a view into a file
" .source main.vim - load it from there
"

" Tabs
" ****
" :tabedit file.one - create a new tab with file.one
" :tab help gt - shows help in a new tab
" gt/T - go to next/previous tab
" :help tab-page
"

" Searching
" *********
" /defult/2 - search for default and move 2 lines below the pattern
" 	    - the "offset" number (here 2) can also be negative
" /const/e - put cursor at the end of match (hence at t)
" /const/e+x - moves x characters forward (x can be negative)
" /const/b-2 - move to the beginning of a word and move 2 characters left
" /that - search for that
" //e - now equals to /that/e
" / - repeat search with same offset (also use n/N)
" // - repeat search but removing the offset
" ?const=e-2 - search backwards and 2 lines up
" /\cword - switch the case sensitive search with \c and \C; overrides preferences
" n/N - go tp next/previouse match
" :cnext - takes you to the next match
" <ctrl-c> - interrupt a search
" :set nowrapscan - now you get an error when search hits the top or bottom of
" file
" /<pattern> - search for a specific pattern forward
" ?<pattern> - search backward
" note: use <up> and <down> arrows for previous searching
"       use 3n for next and 2N for previous and last match
" :set (no)ignorecase - option for searching
" note: : commands also have a history
" * - search the word under the current cursor
" # - search the other direction
" remind: 3*2# etc...
" /the\> - limits the search to the not also for there - try it here
" /\< - search beginning of word
" /\> - search end of word
" /\<the\> - does not match soothe or there
" g#,g* - match partial words
" :set hlsearch - option, higlights each match
" :set incsearch - search while you are typing
" :set nowrapscan - turns of stooping the search at begining or end of file
" /Chapter/+2 - adress 2 line after match (also works with negative numbers)
" /<space><tab> - find spaces before tabs
" /19[0-9][0-9]\|20[0-9][0-9] - press <ctrl-a> hence each year is increased by
" one
" n. - find the next match and do the same
"

" search patterns
" ***************
" /a* - search a any number of times (also empty string)
" /\(ab\)* - matches ab,abab,ababab.etc
" /folders\= - s is optional => matches folder and folders
" /ab\{3,5} - matches abbb abbbb and abbbbb
" /\(ab\]\{,3} - finds ab abab ababab and the empty string
" /a\= - a or empty string
" /a* - 0 or more
" /a\+ - 1 or more
" \a\{3} . exactly 3 times => aaa
" /a.*b - find words starting with a and ending with b
" /foo\|bar - matches foo OR bar
" /\{foo|bar\}\+ - matches foo foobar foofoo barfoo foobarfoo etc
" /end\{if\|while\|for\} - find endif endfor endwhile
" /forever\& - match first character of searched word (here f)
" /[a-z] - find all characters ranging from to z
" /[a-z]\+ - match all words
" /[0123456789abcdef] - guess what it matches
" /[0-9a-f] - also guess
" see \[] for more
" special characters:
" 	\e	<Esc>
"	\t	<Tab>
"	\r	<CR>
"	\b	<BS>
" /"[^"]*" - a double quote any char that's not a double quote many as
" possible and a double quote again => get all quoted words inclusive quotes
" 	item	matches			equivalent ~
"	\d	digit			[0-9]
"	\D	non-digit		[^0-9]
"	\x	hex digit		[0-9a-fA-F]
"	\X	non-hex digit		[^0-9a-fA-F]
"	\s	white space		[ 	]     (<Tab> and <Space>)
"	\S	non-white characters	[^ 	]     (not <Tab> and <Space>)
"	\l	lowercase alpha		[a-z]
"	\L	non-lowercase alpha	[^a-z]
"	\u	uppercase alpha		[A-Z]
"	\U	non-uppercase alpha	[^A-Z]
"	\a      all characters 		[a-zA-Z]
" note: don't use them inside []
" /\f\+ - matches a sequence of characters that can be used as file name
" character classes:
" 	item	matches				option ~
"	\i	identifier characters		'isident'
"	\I	like \i, excluding digits
"	\k	keyword characters		'iskeyword'
"	\K	like \k, excluding digits
"	\p	printable characters		'isprint'
"	\P	like \p, excluding digits
"	\f	file name characters		'isfname'
"	\F	like \f, excluding digits
" /the\nword - matches a line ending with the when the next starts with word
" /the\_$word - matches line ending and whitespace
" /the\_$\+word - allow any amount of whitespace between the and word
" \s - matches whitespace
" \_s - matches whitespace or line break
" \_a - matches alphabetic character or line break
" \_. - matches any character of a line break
" :h usr_27.txt - for patterns
"

" Substitution
" ************
" :%substitute/Professor/Teacher/ - changes first Professor to Teacher in each
" line
" % - is a range and specifies all lines
" :%substitute/Professor/Teacher/g - changes Professor to Teacher
" everywhere
" /c - confirm flag asks
" :s/^the/these - replace the with these only at start of the line
" note: substitution syntax = search syntax
" :s+one/two+one or two+
" :1,5s/this/that/g - changes in line 1 to 5
" :54s/President/Fool/ - change in line 54
" :.write otherfile - writes only the current line into the otherfile
" :.,$/yes/no/ - replace from current position to end of file a yes with a no
" %=1,$ short form
" :?^Chapter?,/^Chapter/s=grey=gray=g - replace all grey with gray, but only
" in this chapter (suppose you have Chapter headings) = is / in this command
" :%s/\s\+$// - find whitespace at end of line and delete it
" 		\s\+ is arbitrary many whitespace
" 		$ if end of line
" :s/2001/2002/g - replace 2001 by 2002; type gv to reselect the same text
" 'magic' is on by default

" Substitute
" **********
" :%s/\<four\>/4/gc - \< and \> match beginning and end of word
" replace a word in more than one file:
" 	vim *.cpp		Start Vim, defining the argument list to
"				contain all the C++ files.  You are now in the
"				first file.
"	qq			Start recording into the q register
"	:%s/\<GetResp\>/GetAnswer/g
"				Do the replacements in the first file.
"	:wnext			Write this file and move to the next one.
"	q			Stop recording.
"	@q			Execute the q register.  This will replay the
"				substitution and ":wnext".  You can verify
"				that this doesn't produce an error message.
"	999@q			Execute the q register on the remaining files.
"Note: you'll get an error on the last while, because :wnext does not work
"      when playing a macro an error stops its execution
" :%s/\<GetResp\>/GetAnswer/ge - e flag: not finding it in one file is no
" error
" :%s/\([^,]*\), \(.*\)/\2 \1/ - change "Last, First" to "First, Last"
" 							\([^,]*\), \(.*\) ~
"	The first part between \( \) matches "Last"	\(     \)
"	    match anything but a comma			  [^,]
"	    any number of times				      *
"	matches ", " literally					 ,
"	The second part between \( \) matches "First"		   \(  \)
"	    any character					     .
"	    any number of times					      *
" \1 and \2 backreference the matched things by \(...\), there are up to 9
" backreferences see :h sub-replace-special
"

" Diffing
" *******
" vimdiff file.one file.two
" editing file.onw and command :certical diffsplit file.two - splits window
" vertically and diffs them
" :set noscrollbind - to deactivate the parallel scrolling while diffing
" :diffupdate - to update the diff
"

" global command
" **************
" :[range]/global/[pattern]/[command] - find a match for a pattern and execute
" a command there - very powerful
" :g+//+s/foobar/barfoo/g - search pattern is included in +s then change
" foobar to barfoo in all commented lines
" :g/./,/^$/join - turn each paragraph into a single line
" 		   :g/./ globally find all ines with at least one character
"		   ,/^$/ range starting from the current to an empty line
"		   join  joins the range of lines together in one line
" :g/\S/,/^\s*$/join - this works with blank lines
"

" Sorting
" *******
" sort a list of files
" 	/^OBJS
"	j
"	:.,/^$/-1!sort
" sorts the following list:
" 	OBJS = \ ~
"		version.o
"		pch.o
"		getopt.o
"		util.o
"		getopt1.o
"		inp.o
"		patch.o
"		backup.o
" :g/^/m 0 - reverse a file: global find start of line(^) and m(ove) it to
" line 0
" :'t+1,.g/^/m 't - mark the first line with mt and reverse this subpart
"
"

" count words
" ***********
" g<ctrl-g> - count words
" :h count-items
"
" man pages
" *********
" K - on one word: find man page for that word (ie. ls)
" :h find-manpage
"

" Calling vim
" ***********
" vim -S vimbook.vim - starts with given session
" vim `grep -l frame_counter *.c` -   open all c files with frame_counter in it
" 				    ` producing a list of files to pass it to
" 				      vom
" use :next and :first to browse through files
" :grep error_string *.c - use :cnext and :cprev two swwitch between matched
" files, use :clist for overview
" note: :grep uses the external tool grep - see option 'grepprg'
" vim -r ** - recover unsaved file (must be in the right directory)
" vim -r - list all swapfiles
" vim -r one.swp - use specific swap file
" vim -h datafile - open dtafile binary
" :set display=uhex - comes in handy here
" g<ctrl-g> - see byte position in file
" 2345go - go to byte 2345
" vim -b datafile and after that :%!xxd to convert to binary view
" :%!xxd -f - convert it back
" see man xxd
" edit change.vim with following text:
" 	%s/-person-/Jones/g
"	write tempfile
"	quit
" now write a shellscript applying these changes to a list of files
" 	for file in *.txt; do
"	  vim -e -s $file < change.vim " run vim in ex=commandline mode
"	  			       " -s do this silently
"	  			       " apply change.im to each file
"	  lpr -r tempfile	       " print and delete(-r) the resulting tempfile
"	done
" ls | vim - - edit the output of the ls command
" vim -s script file.txt ... - - use file.txt commands in normal mode on
" another file
" produceer | vim -S change.vim - - read input form producer (pipe)
" .Z.gz.bz2 - supported zip formats for vim

" Command line
" ************
" move around in command line
" 	<Left>			one character left
"	<Right>			one character right
"	<C-Left>		one word left
"	<C-Right>		one word right
"	CTRL-B 			to begin of command line
"	CTRL-E			to end of command line
" 	CTRL-W			delete cpmplete word
" 	CTRL-U			delete whole text
" 	<insert>		toggles between replace and insert mode
" 	CTRL-C/ESC		abort commandlie (search) in vi esc excutes
" 				the command
" :s(ubstitute)
" :w(rite)
" :r(ead)
" note: in vimscipt use the full name
" :e b<tab> - autocompletion for files starting with b
" 	      vim beeps if there is more than one match
" 	      ctrl-p goes back
" :set isk<tab>
" :set is<ctrl-d> - list completion
" :set ico<ctrl-l> - complete unambigious part
" :h cmdline-completion
" :<up>/<down> - for history
" :history - shows history
" :history / - search history
" q: - opens command line history, use hjkl to move around <enter> to execute
"      don't mess up with :q which quits
"      you can also search in this window
" <ctrl-z> - minimize/suspend gvim
" :!ls - execute ls on shell
" :write => logfile - append text of the current window to logfile (you can
" also use visual mode for this)
" :view file - opens file in read-only mode
" see options 'modifiable' and 'write'
" :saveas move.c - saves the current file under the new name move.c
" :new - opems a new empty file
" :(v)split file.txt - splits the window (vertically) and opens the file
" file.txt
" :3split alpha.c - opens alpha.c in a new window with heigt 3
" :h viminfo
" start vim and press '0 - you right back where you were last time; see :h
" marks
" :mksession vimbook.vim - stores a session to a file
" :source vimbook.vim - restores the session from file
" :qall - quit all windows
" :wall - write all windows 
" :wqall
" :qall!
" :args *.c find all c files and edit the first one, then
" :argdo %s/\<x_cnt\>/x_counter/ge | update - argdo takes another command and
" 					      execute it on all files in the argument list
" 					      substitue x_cnt with x_counter
" 					      g - replace all ocurrences and
" 					      e - avoid interruption by errors
" 					      | - separate two commands
" 					      update - write file only if it
" 					      was changed
" :window/:bufdo - do some command on all windows/buffers
" :ls/:buffers - to see all windows/buffers
" :edit . - starts the vim filebrowser (hit <f1> for help ctrl-j to jump in ctrl-o to jump back)
" :Explore <dir> - start filebrowser in current dir
" :read file.one - inserts file.one at current position
" :%r file.one - append file.one at end of file
" :0r file.one - insert file at beginning of current file
" :.,$write tempo - write current position til end of file to file tempo
" :.,$write! tempo - ! must follow immediately after write otherwise it would
" be a filter command
" :w >>new.txt - buffer is appended tii new.txt
" :set textwidth=72
" :set textwidth - returns current value
" :global - works on whole file without parameters
" :substitue - works on one line without parameters
"

" vim has integrated file directories
" ***********************************
" :cd ... - change working directory to ...
" :pwd - print working director
" local directory - directory binded zo local window
" :lcd - change local diretory
" :h 'path'
" :find me.two - finds me.two in given paths
" g! - open file under cursor
"

" file conversion
" ***************
" :edit ++=>=unix file.txt - ++ff overrules fileformat to unix for file.txt
" let readme.txt be an ms-dos file format
" open readme.txt and
" :set fileformat=unix
" :write
" writing the file in unix format
" on hyperlinks (http://,ftp://,scp://,rcp://) type gf to follow them


" auto completion
" ***************
" se<ctrl-p> - vim completes the rest use ctrl-p/n to switch between guesses
" option 'complete'
" complete certain types of items:
" 	CTRL-X CTRL-F		file names
"	CTRL-X CTRL-L		whole lines
"	CTRL-X CTRL-D		macro definitions (also in included files)
"	CTRL-X CTRL-I		current and included files
"	CTRL-X CTRL-K		words from a dictionary
"	CTRL-X CTRL-T		words from a thesaurus
"	CTRL-X CTRL-]		tags
"	CTRL-X CTRL-V		Vim command line
"	CTRL-X CTRL-N		autocompletion for text in insert mode
" see ins-completion
" 	CTRL-X CTRL-O 		omni compltion
" 				see compl-omni-filetypes

" Scrolling
" *********
" scrolling (in line) with keeping the curspr where it is:
" 	zh		scroll right
"	4zh		scroll four characters right
"	zH		scroll half a window width right
"	ze		scroll right to put the cursor at the end
"	zl		scroll left
"	4zl		scroll four characters left
"	zL		scroll half a window width left
"	zs		scroll left to put the cursor at the start
" when nowrap is set and you scroll in one line you can move the cursor
" deoendend on what you see:
" 	g0		to first visible character in this line
"	g^		to first non-blank visible character in this line
"	gm		to middle of this line
"	g$		to last visible character in this line********
"

" Folding
" *******
" zfap - fold a paragraph together
" zf2j - fold the following 3 lines
" zo - open the fold
" zc - close a folding again
" zf . create a fold
" idea: use nested folds
" zr - unfold all folds
" zD - delete all fold on cursor line
" :set foldcolumn=4 - displays a folding column on the left
" :set foldopen=all - opens all folds as you roll over
" :set foldopen& - reset to default
" :set foldclose=all - closes every fold if you move out of it
" note: folding is local to window
" :mkview - save folds
" :loadview - load folds (and other 'viewoptions') again
" :set foldmethod=indent - fold by indent
" :set foldlevel=3 - all lines with 'shiftwidth 3 or more are folded
" zM - set foldlevel to 0
" zR - set foldlevel to the deepest
" see 'fold-indent','fold-marker','fold-syntax','fold-expr','fold-diff'
"

" digraphs
" ++++++++
" <ctrl-k>Co - make the copyright symbol (a digraph)
" :digraphs - list all digraphs
" :digraph a" ä - define own digraph

" paragraphs
" **********
" v4jgq - gq formats a paragraph
" see auto-format
" gq4j - same as above
" } - moves to the end of a paragraph
" gq} - format from the cursor to the end of a paragaraph
" gqap - ap stands for a paragraph
" note: paragraphs are separated by empty lines
" gggqG - gg move to first line gqG format til last line
" warning; a blank line is not an empty line

" links
" *****
" ctrl-w f - open hyperlink in new window perhabs install wget and scp
" see netrw
" ctrl-altgr-] - follow a link in vimhelp
" cttrl-] - follow a link (under the cursor) in the vim help 
" ctrl-t,ctrl-o - jump back from/to last link
" <ctrl+altgr+]> - follow links in help


" wrapping
" ********
" gj/gk - move to a wrapping line below/above
" idea: bind these with mappings to arrow keys <up> and <down>
"

" indent
" ******
" :set autoindent - next line gets the same indent as previous line
" >> - indent the current line (> increases indent)
" 4>> - increase the indent of 4 lines

" virtual edit
" ************
" :set virtualedit=all - virtual space editing; makes editing tables easier
" BJ - move back to the start of a whitespace separated word
" note: use visual block mode for editing tables
" :set virtualedit> - deactivate virtual cursor movement


" insert mode
" ***********
" special keys in insert mode:
" 	<C-Home>	to start of the file
"	<PageUp>	a whole screenful up
"	<Home>		to start of line
"	<S-Left>	one word left
"	<C-Left>	one word left
"	<S-Right>	one word right
"	<C-Right>	one word right
"	<End>		to end of the line
"	<PageDown>	a whole screenful down
"	<C-End>		to end of the file
" see ins-special-special

" Tags
" ****
" ctags *.c - on command line tag all c files in current directory
" :tag startlist
" :tags - show list of tags
" see 'tags' option
"

"
"
"
" Breaking lines
" **************
" set textwidth=30 - break the line after 30 characters (insert line break automatically)
" wrap option - displays lines with a line break
" gq - get a line aligned after you delete a word
" v4jgq - v visual mode 4j 4 lines down and realign
" see :h autoformat
" gq4j -  less typing but you have to know the line count
" } - move to the end of a paragraph
" gq} - foramt until end of paragraph
" gqap - ap stands for a paragraph, hence format the current paragraph
" note: a paragraph is separaetd by empty lines
" gggqG - gg beginning of file, G end of file, hence format the whole file
" Warning: joins also not proper separated paragraphs, tab and spaces are not
" emtpy lines!
" see fo-table to format tables and more
" set joinspaces - change the number of spaces used after a full stop
" see formatprg  to format text in vim with an evternal program
" :{range}center [width]
" :1,5center 40 - format lines 1 to 5 with a width of 40
" :1,5right 37 - similar with right alignment
" :left 5 - indet of 5 form the left
" package justify - to justify text, or use an external program
" set autoindent - insert indents automatically
" >> - add one indent to the current line
" set shiftwidth - indent length for the line indent (default 8 - keep that)
" 4>> - increases indent of four lines
" set softtabstop=4 - tabwidht is 4
" set expandtab - indet with spaces instead of tab
" :retab 8 - change  tabstop to 8 and reformat the file
" set nowrap - dont wrap a line if it does not fit into the window
" set guioptions+=b - show horizontal scrollbar in the GUI
" 
" Scrolling
" *********
" 	zh		scroll right
" 	4zh		scroll four characters right
" 	zH		scroll half a window width right
" 	ze		scroll right to put the cursor at the end
" 	zl		scroll left
" 	4zl		scroll four characters left
" 	zL		scroll half a window width left
" 	zs		scroll left to put the cursor at the start
" suppose teh cursor is on w of which:
" 			      |<-- current window -->|
" 		some long text, part of which is visible in the window ~
" 	ze	  |<--	   window     -->|
" 	zH	   |<--     window     -->|
" 	4zh		  |<--	   window     -->|
" 	zh		     |<--     window	 -->|
" 	zl		       |<--	window	   -->|
" 	4zl			  |<--	   window     -->|
" 	zL				|<--	 window     -->|
" 	zs			       |<--	window	   -->|
" never scroll witch these commands
" g0		to first visible character in this line
" 	g^		to first non-blank visible character in this line
" 	gm		to middle of this line
" 	g$		to last visible character in this line
" 		|<--	 window    -->|
" 	some long    text, part of which is visible ~
" 		 g0  g^    gm	     g$
"
" set linebreak is better than wrap or nowrap
" 'breakat' specifies the characters where a break can be inserted.
" showbreak' specifies a string to show at the start of broken line.
" Set 'textwidth' to zero to avoid a paragraph to be split.
" dj dk  - without linewrap the same a j and k, with linewrap move the cursor
" one line up or down
" :g/./,/^$/join  
" :g/./ - find globally all lines that contain at least one character
"	,/^$/ - range starting from the current (non-empty) line until an mpty line
"		join - joins the range of lines tigether into one line
" note: does not work with blanked or tabbed lines!
" :g/\S/,/^\s*$/join - works wirh blank lines but still requires a blank or
" empty line at the end of the file
"
" Editing tables
" **************
" Suppose we have the following table
" 	nice table	  test 1	test 2	    test 3 ~
" 	input A		  0.534
" 	input B		  0.913
" set virtualedit=all
" /test 3 and prsss j - to enter a value for test 3 of input A
" press Bj
" copying the third coulumn:
" move to the left upper corner of a coulumn
" CTRL-V 2j 9l y
" move cursor to test 1 and press P
" set virtualedit= - back to non-virtual moevemnts
" in table cells use rx,grx,R0.786 and gR0.786
" /19[0-9][0-9]\|20[0-9][0-9]
" \| or, [0-9] range pattern
" press 4 CTRL-A to increase a number by 4 (remind octals start with 0 unless
" you use set nrformats-=octal
" CTRL-X is similar for substraction
" :args *.c - put all c-files in the argument list
" :argdo %s/\<x_cnt\>/x_counter/ge | update - \< and \> to match the whole
" world only, e supressses errormesssages which would abort the batch job; |
" seperates two commands, update saves the file only when changes were made.
" windo and bufdo execute its argument in all widows or buffers, but beware
" because the bufferlist might be bigger than you think, check it with buffers
" like ls
" for shell scripts ex-mode (=command mode) is better than normal mode:
" 	%s/-person-/Jones/g
" 	write tempfile
" 	quit
" put these lines in change.vim and use the following shell script:
" 	for file in *.txt; do
" 		vim -e -s $file < change.vim
" 		lpr -r tempfile
" 	done
" -e exmode -s silently
"  lpr -r tempfile - prints the tempfile and deletes it (-r) afterwards
" vim -w script file.txt - records the edit of file.txt to script; script can
" be edited later -W overrides the cripts file
" set ignorecase smartcase - search patterns with uppercases make the search
" casesensitive
" /\cword /\CwoRd make the search case(in)sensitive no matter what ignorecase
" and smartcase options we have; advantage: search history knows about
" case(in)sensitivity
" Note: set magic - changes use of "\"-items in search patterns
" 	interrupt a search with CTRL-C or CTRL-Break on Windows if it takes
" 	too long
" searching for filenames
" 	:set isfname
" 	isfname=@,48-57,/,.,-,_,+,,,#,$,%,~,=
" /the\nword - searches with linebreak \n
" /the\_sword - \_s searches for a space or a line break
" /the\_s+word - allow many whitespaces between the and word
" /\_a - searches an alphabetix charactre or a line break
" /\_. - searches any character or a line break (attetion: can be very slow)
" /"\_[^"]*" - matches a double quote split over several lines
" /\d\u\u\u\d\d - search for something like NGU103
" /\d\u{3}\d\{3} - searches the same
" /[0-9][A-Z]\{3}[0-9]\{3} - using [] ranges but is slower
" /\<\h\w*\> - \< and \> find only whole words, \h = [A-Za-z_] and \w = [0-9A-Za-z_]
" Note: \< and \> depend on iskeyword option
" /\w\@<!\h\w*\w\@! - try this yourself
"
" :set path
" :set define
" == - reindent one line
" gg=G - reindent the whole file
" :set cinoptions - indent options
" filetyüe indent on/off - en-/disables detecting the filetpe and switches cindent on if necessary
" see indent-expression
" autoindent, smartindent options
" lines starting with # are not indented
" option shiftwidth
" to remove or add one shiftwidth of indent use CTRL-D and CTRL-T in insert
" mode
" in Normalmode use << and >> to remove or add one shiftwidth for indent
" >i{ - add one indent inside the current block of {}
" >a{ - does the same including the {}-lines
" tabstop is 8 by default because its often 8 on printers and other systems
" for files with different tabstop see 25.3 to fix it
" :set softtabstop=4 - vim uses a combination of spaces and tabs
" for indentation and combines 8 spaces to one tab
" <BS> will always delete the amount specified by softtabstop
" :set expandtab - alls inserted tabs will be spaces
" :set expandtab
" :%retab - replace all tabs to spaces expect for them after a non-blank
" character; if you want to replace tham as well use ! by retab
" Warning: retab! also replaces tabs inside strings
" use /"[^"\t]*\t[^"]*"  to find tabs inside strings, but its recommended to
" use "\t" in strings
" :set noexpandtab
" %retab! - convert all spaces back to tabs
" gq]/ - bring a twolines commnet in one line
" o in middle of a comment starts a new line
" see formatoptions
" :set comments=:// - sets comments to //
" beofre the colon you can place some flags
" :set comments=n:>,n:! - comments starting with > and ! and are nested (n) 
" :set comments=s1:/*,mb:*,ex:*/ - for nice c comments; see format-comments
" Only on GUI (starting with g)
" g :browse split /etc - opens a file browser in /etc and splits the window if
" g you select a file
" g when you use browse again it uses the last opened directory see option
" g browsedir
" g :confirm edit foo.txt - produces a dialog 
" g :confirm browse edit - test it
" g use the <Alt>-key to acces the menu
" g :winpos - see current windows position on screen
" g :winpos 172 103 - moves the window to the given position
" g you can set lines and columns for the size of a window
" g gvim -geometry 80x25+100+300 - from command line
" g gvimrc is like vimrc but for graphical environments
" The undo tree
" :earlier 1f - takes you back to the time you last edited the file
" :later 1f - takes you forward again
" the undo tree can branch
" :undo 2 
" use g+ g- to navigate through the undo tree
" :echo undotree()
" :inoremap - Insertmode
" :vnoremap - Visualmode
" :nnoremap - Normalmide
" :iunmap,vunmap,nunmap - unmap mappings
" special chars for mapping: <Bar><Space>
" abbrevations are triggered, when you type a non-word-character after an
" abbrevation, a mapping is triggered when you type it's last character
" <Nop> - maps a key to nothing
" :command DeleteFirst 1delete - when you execute :DeleteFirst Vim executes
" :1delete; note: Use capital letters to start defining a commnd
" use :command to see all commands
" user defined commands can take a series of arguments. Their number is
" specified in the -nargs option
" :command -nargs=0 DeleteFirst 1delete
" -nargs=0 no arguments (default)
" -nargs=1 one argument
" -nargs=* any number of arguments
" -nargs=? Zero or one argument
" -nargs=+ one or more arguments
" :command -nargs=+ Say :echo "<args>" - now type :Say Hello World
" :command -nargs=+ Say :echo <q-args> - :Say Hello "World" will result in
" corret escaped characters
" <f-args> is used for calling function arguments
" :command -range=% SaveIt :<line1>,<line2>write! save_file - save the whole
" file to save_file
" -range default is the current line
" -range=% the whole file
" -range={count} the last number in it is used as a single number whose
"  default is {count}
" other keyword in command
" -count={number} the count can be used by the <count> keyword
" -bang results in a !
" -register specifies a register, use <reg> to use it
" -complete={type} see :command-completion for a list of possible values
" -bar the command can be followed by | and another command, or " and a
"  comment
" -buffer only availible in the current buffer
" use ! to redefine commands
" :delcommand SaveIt - deletes the command SaveIt
" :comclear - deletes all user commands !cannot be undone!
" Autocommands
" autocommands are executed automatically in response to some event
" :function DateInster() - replace date timestamp on the end of a file ech
" time it is written
" : $delete
" : read !date
" :endfunction
" call it every time just before a buffer is written to a file:
" :autocmd BufWritePre * call DateInsert() - * mathches to (every) filename
" :autocmd [group] {events} {file_pattern} [nested] {command}
" [group] is optional
" {events} is a list of events (separated by comma) that trigger the command
" {file_pattern} is a filename, ie. *.txt for all textfiles
" [nested] is a flag, that allows nesting autocommands
" {command} is the command to be executed
" autocmd FileType tex inoremap wraum Wahrscheinlichkeitsraum - redefines
" wraum in .tex files
" BufReadPost is triggered after a new file is being edited
" :autocmd BufNewFile *.[ch] 0read ~/skeletons/skel.c - inserts the contents
" of skel.c in a new .c or .h file
" you can also comma separate the {file_patterns} and use any file/directory
" specification
" :autocmd! FileWritePre * - !deletes all autocommands for FileWritePre that
" uese the * pattern
" autocmd [group] - lists all autocommands (of the specific group)
" place autocommands in augroups by
" :augroup MyGroup
"  autocmd BufReadPost *.c,*.h :set sw=4 sts=4
"  autocmd BufReadPost *.cpp :set sw=3 sts=3
" :augroup EMD
" autocmd! MyGroup - deletes all autocommands in MyGroup
" NESTING: generally commands don't call new events, to do this use nested
" :autocmd BufReadPost *.new execute "doautocmd BufReadPost "
" .expand("<afile>:r") - autocommand that is triggered when editing a file
" ending with .new
" when editing the file "tryout.c.new" the executed command will be :doautocmd
" BufReadPost tryout.c
" the expand() takes <afile> argument which stands for the fikebane tha
" autocommand was executed for nad takes the root with :r
" :doautocmd executes in the current buffer; :doautoall executes on all
" buffers
" :autocmd BufReadPost *.log normal G - go to end of a log file in Normal mode
" if you use i in normal mode you have also use <Esc> again to exit it
" if you use "/" to start a search use <CR> to eecute it
" the :normal command uses all the text after it as a command
" :autocmd BufReadPost *.chg execute "normal ONew entry:\<Esc>" |
" 	\ 1read !date -  use \ to break long lines in vum
" 'eventignore' option holds autocommands that are ignored
" VimScript
" :let i = 1
" :while i < 5
" :  echo "count is" i
" :  let i += 1
" :endwhile
" outputs 5 times count is $i.
" interrupt an (endless) loop by CTRL-C
" :for i in range(1, 4)
" :  echo "count is" i
" :endfor
" prints our 4 lines
" 0x starts hexadecimal number
" 0 starts an octal number
" :echo 0x7f - 036 - substracting numbers of different format
" use underscores in variables
" s: is a prefix for a local variable, ie s:counter
" see script-variable and internal-variables
" b: local to buffer
" w: local to a window
" g: global variable
" v: variable prefix by Vim
" :unlet s:counter - deletes the local counter variable
" use ! to get no error if variable does not exists
" :if !exists("s:call_count")
" :  let s:call_count = 0
" :endif
" :let s:call_count = s:call_count + 1
" :echo "called" s:call_count "times"
" use an old variable to count
" note that the variable name passed to exists() must be in quotes
" :let name = "\"peter\""
" :echo name
" echos peter in quotes
" '\huhu' all is written as spelled
" in "" you can use special commands:
" \t		<Tab>
" \n		<NL>, line break
" \r		<CR>, <Enter>
" \e		<Esc>
" \b		<BS>, backspace
" \"		"
" \\		\, backslash
" \<Esc>		<Esc>
" \<C-W>		CTRL-W
" note: you should use \t in programming languages and not hardcode tabs
" see expr-quote
" basic expressions:
" $NAME - environment variable
" &name - option
" @r - register
" see also expression-syntax for more information
" generell math is there
" concatenate strings with a dot
" (a) ? (b) : (c) - if a evaluates to true b is used otherwise use c
" :if
" 	{statements}
" :else
" 	{statements}
" :elseif {condition}
" 	{statements}
" :endif
" use if and else as in any other programming language
" Logic operators
" == - equal
" != - unequal
" >(=) - greater (or equal)
" <(=) - smaller (or equal)
" v:version for Vim version
" for strings we have two more comparators:
" :if str =~ " "
" :  echo "str contains a space"
" :endif
" :if str !~ '\.$'
" :  echo "str does not end in a full stop"
" :endif
" use single quotes for a pattern
" ==? - compares strings to be equal ignore case
" !~# - checks if a pattern doesn't match and checking case
" :continue - jump back to the start of th while loop
" :break - jump forward to ":endwhile"
" :execute allows executing the result of an expression
" :execute "tag " . tag_name - what does this?
" :normal executes command in normal mode
" :normal gg=G - formats the whole file
" :execute "normal " . normal_commands
" :execute "normal Inew text\<Esc>" - \<Esc> avoids <Esc> in your script
" use eval() function to evaluate a string and get its expression
" :let optname = "path"
" :let optval = eval('&' . optname)
" &path results in the path option
" :exe 'let optval = &' . optname - does the same
" see functions for a complete list of functions
" :call search("Date: ", "W") -W flag -> search doesn't wrap around the end of
" a file
" :let line = getline(".")
" :let repl = substitute(line, '\a', "*", "g")
" :call setline(".", repl)
" the result of this is equal to: :substitue/\a/*/g
" Use CTRL-] to jump to detail help on a function
" function-list,string-functions,list-functions,dict-functinos,float-functions,bitwise-functions,var-functions,cursor-functions, mark-functions, text-functions,system-functions,file-functions, date-functions,time-functions,*buffer-functions,window-functions,arg-functions,command-line-functions,quickfix-functions,completion-functions,folding-functions,syntax-functions,highlighting-functions, and many more...
" :function Min(num1, num2)
" :  if a:num1 < a:num2
" :    let smaller = a:num1
" :  else
" :    let smaller = a:num2
" :  endif
" :  return smaller
" :endfunction
" a:var tells vim that this is a function variable
" :echo Min(5,8)
" :function! Min(num1,num2,num3) - redefine the function Min
" :function Count_words() range
" :  let lnum = a:firstline
" :  let n = 0
" :  while lnum <= a:lastline
" :    let n = n + len(split(getline(lnum)))
" :    let lnum = lnum + 1
" :  endwhile
" :  echo "found " . n . " words"
" :endfunction
" :10,30call Count_words() - count all word on lines 10 to 30
"
" :function  Number()
" :  echo "line " . line(".") . " contains: " . getline(".")
" :endfunction
" :10,15call Number() - this function will be called six times
" function Show(start, ...) - a:1 contains first optional argument a:2 the
" second one, a:0 contains number of extra arguments
" :function Show(start, ...)
" :  echohl Title
" :  echo "start is " . a:start
" :  echohl None
" :  let index = 1
" :  while index <= a:0
" :    echo "  Arg " . index . " is " . a:{index}
" :    let index = index + 1
" :  endwhile
" :  echo ""
" :endfunction
" :echohl specifies highlighting for following echo command; :echon doesn't
" output a line break
" a:000 is a list of all the ...-arguments see a:000
":function [name] - shows information about specific function
" see debug-scripts for debugging mode and use the verbose option
" :delfunction Show - deletes the function Show (outputs an error if it
" doesn't exist)
" you can also use function references
" :let alist = ['aap', 'mies', 'noot'] - defines a list
" :let alist = []
" :call add(alist, 'foo')
" :call add(alist, 'bar')
" :echo alist
" :echo alist + ['foo', 'bar'] - concatenaption of lists, you can also use the
" extend function
" note: add as a function has another effect than list concatenaption
" :let alist = ['one', 'two', 'three']
" :for n in alist
" :  echo n
" :endfor
" iterate over a list
" :for a in range(3)
" :  echo a
" :endfor
" iterateover range
" :for line in getline(1, 20)
" :  if line =~ "Date: "
" :    echo matchstr(line, 'Date: \zs.*')
" :  endif
" :endfor
" looks at the first 20 lines and echoes any date found in there
" :let uk2nl = {'one': 'een', 'two': 'twee', 'three': 'drie'}
" :echo uk2nl['two']
" a simple dictionary
" dictionaries are not ordered (if you wnat that use lists)
" :echo uk2nl['one'] - outputs een
" :let uk2nl.four = 'vier' - extend the dictionary
" you can also store a reference of a function in a dictiionary
" :function uk2nl.translate(line) dict
" :  return join(map(split(a:line), 'get(self, v:val, "?notfound_value?")'))
" :endfunction
" :echo uk2nl.translate('three two five one')
" returns the values of the dictionary
" dict at the end of :function marks this function to be used with a
" dictionary
" for more see list-identity and dit-identity and also Lists and Dictionaries
" exceptions
" :try
" :   read ~/templates/pascal.tmpl
" :catch /E484:/
" :   echo "Sorry, the Pascal template file cannot be found."
" :endtry
" an exception is a string
" :try
" :   read ~/templates/pascal.tmpl
" :catch
" :   echo "Sorry, the Pascal template file cannot be found."
" :endtry
" catches all errors
" :let tmp = tempname()
" :try
" :   exe ".,$write " . tmp
" :   exe "!filter " . tmp
" :   .,$delete
" :   exe "$read " . tmp
" :finally
" :   call delete(tmp)
" :endtry
" call delete(tmp) is always executed even when the user presses CTRL-C
" see exception-handling for more information
" beware of the system differences between windows and unix see :source_crnl
" In a vimscript file blank lines are allowed and ignored
" :set cpoptions	=aABceFst - empty spacesare ignored
" if you need whitespaces escape them with \ (backslash)
" " starts a comment line in vimscript
" wrong:
" :abbrev dev development	" shorthand
" :map <F3> o#include		" insert include
" :execute cmd			" do it
" :!ls *.c			" list C files
" There can be no comment after :map :abbrev :execute and ! commands
" if you need a comment in such a line seperte it with |
" #!/usr/bin/env vim -S
" echo "this is a Vim script"
" quit 
" special bash command for vimscript
" :map ,ab o#include
" :unmap ,ab 
" here unmap doesn't work because of the ending whitespace
" :unmap ,ab     " comment
" here vim tries to unmap ,ab     
" better use the following
" :unmap ,ab|    " comment
" :map ,p ma"aYHmbgg"aP`bzt`a
" ma"aYHmbgg"aP`bzt`a
" ma			set mark a at cursor position
"   "aY			yank current line into register a
"      Hmb		go to top line in window and set mark b there
" 	gg		go to first line in file
" 	  "aP		put the yanked line above it
" 	     `b		go back to top line in display
" 	       zt	position the text in the window as before
" 		 `a	go back to saved cursor position
" to avoid inteference with function names use a special abbrevation ie CM_
" put the definitions of your funtions in a fila and set a global variable to
" indicate that the functions have been loaded ie. CM_LOADED. When sourcing
" the file again first unload the functions
" Writing plugins
" two types of plugins:
" global plugins - for all type of files
" filetype plugins - only for files of a specific type
" first lets look at global plugins
" choose a good name for your plugin (limit name to 8 characters on old
" windows systems)
" we use a script that corrects typing errors called "typecorr.vim"
" iabbrev teh the
" iabbrev otehr other
" iabbrev wnat want
" iabbrev synchronisation
" \ synchronization
" let s:count = 4
" put a header in your plugin, ie,
" Vim global plugin to correct typing errors
" last change: 2000 Oct 15
" Maintainer <name> <email>
" note also the liscense type
" save and restore current coptions:
" let s:save_cpo = &cpo
" set cpo&vim
" ...
" ...
" let &cpo = s:save_cpo
" unlet s:save_cpo
" note: s:var is a local script variable
" diasable loading of the plugin (if you've already loaded it):
" if exists("g:loaded:typecorr")
" 	finish
" endif
" let g:loaded_tapecorr = 1
" finish stops vim reading the rest of the file
" add some mappings (perhabs with the leaderkey involved)
" using "unique" parameter for mapping causes an error if the mapping already
" exists
" if !hasmapto('<Plug>TypecorrAdd')
" 	map <unique> <Leader>a <Plug>TypecorrAdd
" endif
" map ,c <Plug>TypecorrAdd - maps it to ,c
" function s:Add(from, correct) - defines a local function
" you can also use <SID> (that's better)
" noremenu <script> Plugin.Add\ Correction      <SID>Add - adds a menuentry
" in Plugin menu
" difference between <Plug> and <SID>:
" <Plug> is visible outside of a script, used for mappings which a user might
" want to map to a key sequence
" <SID> the script id, translated internally to <SNR>
" if !exists(":Correct")
"  command -nargs=1  Correct  :call s:Add(<q-args>, 0)
" endif
" only defined if its not yet defined
" variables starting with s: are script variables
" 1 " Vim global plugin for correcting typing mistakes
" Last Change:	2000 Oct 15
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" License:	This file is placed in the public domain.
"  if exists("g:loaded_typecorr")
"  finish
" endif
" let g:loaded_typecorr = 1
" let s:save_cpo = &cpo
" set cpo&vim
" iabbrev teh the
" iabbrev otehr other
" iabbrev wnat want
" iabbrev synchronisation
"  \ synchronization
" let s:count = 4
" if !hasmapto('<Plug>TypecorrAdd')
"   map <unique> <Leader>a  <Plug>TypecorrAdd
" endif
" noremap <unique> <script> <Plug>TypecorrAdd  <SID>Add
" noremenu <script> Plugin.Add\ Correction      <SID>Add
" noremap <SID>Add  :call <SID>Add(expand("<cword>"), 1)<CR>
" function s:Add(from, correct)
"   let to = input("type the correction for " . a:from . ": ")
"   exe ":iabbrev " . a:from . " " . to
"   if a:correct | exe "normal viws\<C-R>\" \b\e" | endif
"   let s:count = s:count + 1
"   echo s:count . " corrections now"
" endfunction
"
" if !exists(":Correct")
"   command -nargs=1  Correct  :call s:Add(<q-args>, 0)
" endif
"
" let &cpo = s:save_cpo
" unlet s:save_cpo
" line 33: applies the new correction to the word under the cursor
" set option fileformat=unix to make scripts work on unix
" wirte some documentation for your plugin
" you can create a filetype detection snippet in a seperate file
" ie:
" au BufNewFile,BufRead *.foo		set filetype=foofoo
" witre this as "ftdetect/foofoo.vim" under .vim-directory
" Writing filetype Plugins
" options and mapping are only vlid for the current buffer
" put this at the begin of your plugin to be able to disable it:
" Only do this when not done yet for this buffer
" if exists("b:did_ftplugin")
"   finish
" endif
" let b:did_ftplugin = 1
" avoids also that the same plugin is loaded twice
" users can disable th eplugin completely by
" let b:did_ftplugin = 1
" requires thath the filetype plugin directory comes before VIMRUNTIME in
" 'runtimepath'!
" ensure the filetypeplugin only affects the current buffer use :setlocal
" when an option already exists use -= and += to keep existing values
" first resetting to default value and then changing it is a good idea:
" :setlocal formatoptions& formatoptions+=ro
" use :map <buffer> to be sure that mappings only apply to current buffer
" hasmapto is used to check if the user already defined a mapping
" the user must have the option to disable the mappings of a filetypeplugin
" without disabling everything:
" Add mappings, unless the user didn't want this.
" if !exists("no_plugin_maps") && !exists("no_mail_maps")
"   " Quote text by inserting "> "
"   if !hasmapto('<Plug>MailQuote')
"     vmap <buffer> <LocalLeader>q <Plug>MailQuote
"     nmap <buffer> <LocalLeader>q <Plug>MailQuote
"   endif
"   vnoremap <buffer> <Plug>MailQuote :s/^/> /<CR>
"   nnoremap <buffer> <Plug>MailQuote :.,$s/^/> /<CR>
" endif
" global variables used are
" no_plugin_maps - diabling mappings for all filetype plugins
" no_mail_maps - disabling mappings for the "mail" filetype
" add user command for specific filetype:
" command -buffer Make make %:r.s
" s:var script variable; b:var buffer variable
" :if !exists("*s:Func")
" :  function s:Func(arg)
" :    ...
" :  endfunction
" :endif
" the function is only defined once because the filetypeplugin is loaded
" everytime you open the specific filetype
" using :setfiletype xyz the previous filetype effects should be undone:
" let b:undo_ftplugin = "setlocal fo< com< tw< commentstring<"
"  \ . "| unlet b:match_ignorecase b:match_words b:match_skip"
" setlocal with < after the option resetes the option to ist global value
" (reset an optionvalue in this way!)
" doesn't require removing the "C" flag from 'coptions' to allow line
" continuapt-get install on as mentioned in use-cpo-save
" filetype must be included in the filename of a ftplugin (ft = filetype)
" use :compiler command to set 'errorformat' and 'makeprg' options
" :next $VIMRUNTIME/compiler/*.vim - edit all default compiler plugins
" use :next to got to the next plugin file
" :if exists("current_compiler")
" :  finish
" :endif
" :let current_compiler = "mine"
" allows you to overrule of add to the default file; put a compiler file in
" your personal runtime directory
" use :set for :compiler! and :setlocal for :compiler
" Vim defines the :CompilerSet user command for this
" writing a compiler plugin, you overrule settings from a default plugin
" quickloadplugin: basic idea is a two step process: first load user command
" and mappings and second load functionality, but since Vim 7 there's an
" alternapt-get install ve called autoload
" " Vim global plugin for demonstrating quick loading
" Last Change:	2005 Feb 25
" " Maintainer:	Bram Moolenaar <Bram@vim.org>
" " License:	This file is placed in the public domain.
"
" if !exists("s:did_load")
" 	command -nargs=* BNRead  call BufNetRead(<f-args>)
" 	map <F19> :call BufNetWrite('something')<CR>
"
" 	let s:did_load = 1
" 	exe 'au FuncUndefined BufNet* source ' . expand('<sfile>')
" 	finish
" endif
"
" function BufNetRead(...)
" 	echo 'BufNetRead(' . string(a:000) . ')'
" 	" read functionality here
" endfunction
"
" function BufNetWrite(...)
" 	echo 'BufNetWrite(' . string(a:000) . ')'
" 	" write functionality here
" endfunction
" If the script is first loaded s:ddi_load is not set thus commands between if
" and endif will be executed, ending in a finish command, discaarding the rest
" of the file
" second time the script is loaded commands after endif are executed; this
" defines the (possible) long functions
" drop this script in your plugin directory and the following will happen:
" 1) BNRead command is defined, <F19> is mapped at startup; FuncUndefined as
" autocommand is defined; finish causes to exit early
" ") user calles BNRead ~> coressponding functions will be called
" 3) Vim can't find the function and triggers the FuncUndefined autocommand
" event. Hence source fname will be executed. fname will be the name of the
" script
" 4) script is sourced again and the functions are defined
" an alternative is autolaod
" The following is for mourse users only
"
"	if !exists('*MyLibFunction')
"	   runtime library/mylibscript.vim
"	endif
"	call MyLibFunction(arg)
" note that you need to fedine the right runtimepath - see runtimepath
" an easier way is the following:
" 	call mylib#myfunction(arg)
" use names before your function to protect them from overriding
" 	~/.vim/autoload/netlib/ftp.vim
" where the function is defined like this: >
"	function netlib#ftp#read(fname)
"		"  Read the file fname through ftp
"	endfunction
" part before (last) # exactly matches the subdirectory and scriptname
" you can also use this for variables:
" 	let dutch#weekdays = ['zondag', 'maandag', 'dinsdag', 'woensdag',
" 		\ 'donderdag', 'vrijdag', 'zaterdag']
"see autoload
" to pack vimscripts together see vimball
" 42
" to definde own menu commands use the :menu command
" :menu File.Save :update<CR> - overrides the save command to write the file
" when its modified
" use Edit.Settings.Shiftwidth to define a new submenu item in the Edit menu
" :menu is very similar to .map command the right side is used as if it were
" typed in
" §File.&Save are accelerators (alt-f and alt-s) but can be disabled
" WARNING: use every accelerator only once, Vim doesn't warn you!
" actual definition of the Save option in File menu:
" 	:menu 10.340 &File.&Save<Tab>:w  :confirm w<CR>
" the number (first one) defines the position in the menu bar, the second the
" position in the actual menu
" 	:menu 10.305 &File.&Do\ It\.\.\. :exit<CR>
" you must escape some charaters to represent them in the menu
" &File.&Save<Tab>:w" - :w is a hint
" :amenu 20.510 Edit.-sep3- : - this is a seperator which is never executed
" but needs a definition, so a : is enough
" there are different types of menues like in the map command, that are
" menu,nmenu,vmenu,omenu,menu!,imenu,cmenu and amenu
" :amenu <silent> Mine.Next\ File :call <SID>NextFile()<CR> - silent supresses
" the comment in the command line
" :amenu Edit - lists only the Edit menu items for all modes
" you can also delete menus with unmenu but it is not recommended
" you can change the appearance of the menus, see guioptions
" (you can use :menutrans for translations)
" :amenu File.Open  :browse confirm edit<CR> - :browse opend the file browser;
" confirm pops up a dialogue if the current buffer was changed
" two speacial menus (ToolBar and PopUp) does not appear in the normal menu
" bar
" the toolbar only appears if the T flage is included in the guioptions
" ToolBar.New causes New item to appear on the toolbar
" the table of icons can be found in builtin-tools
" 	:tmenu ToolBar.Compile  Compile the current file
" if you need icons they are different on different system
" tooltips can be defined and undefined with t(un)menu
" you can also define the popup menu, but it's not interesting here...
" 43
" filetype plugins; see add-filetyoe-plugin
" see setlocal and softtabstop
" filetype plugins are binded to the local buffer
" see write-plugin
" to recognize (unknown) filetypes you need an own directory, see
" your-runtime-dir
" create a file "filetype.vim" which contains autocommands for your filetype
" setf command
" see autocmd-patterns
" 	augroup filetypedetect
"	au BufNewFile,BufRead *.txt			setf text
"	augroup END
" sets new filetype text
" see runtimepath
" recognize filetypes by content:
" 	if did_filetype()
"	  finish
"	endif
"	if getline(1) =~ '^#!.*[/\\]xyz\>'
"	  setf xyz
"	endif
" first avoid to check already known filetypes
" order of checks:
" 	1. filetype.vim files before $VIMRUNTIME in 'runtimepath'
"	2. first part of $VIMRUNTIME/filetype.vim
"	3. all scripts.vim files in 'runtimepath'
"	4. remainder of $VIMRUNTIME/filetype.vim
"	5. filetype.vim files after $VIMRUNTIME in 'runtimepath'
" 44
" syntax highlighting, see :syn-define
" using an existing syntax file to start with saves a lot of time, see
" $VIMRUNTIME/syntax for examples
" :syntax clear - clears all old definitions (not required in final syntax
" file but good for experiments)
" :syntax - checks which syntax items are currently defined
" :syntax case match/ignore - make syntax case (in)sensitive
" 	:syntax keyword {group} {keyword} ...
" group is the name of the syntax group; examples:
" 	:syntax keyword xType int long char
" 	:syntax keyword xStatement if then else endif
" define the x-language (example). In a syntax file for csh use cshType
" instead
" the prefix is equal to the value of filetype
" you need now connect the x group names to standard Vim names by:
" 	:highlight link xType Type
"	:highlight link xStatement Statement
" see group-name for the standard names
" characters used in keywords must be in the iskeyword option, otherwise the
" word would not match and Vim does not warn you!
" 	:setlocal iskeyword+=-
" 	:syntax keyword xStatement when-not
" defines the when-not as a language keyword (also remind of setlocal to the
" current buffer)
" :syntax keyword xStatement n[ext] - allows abbreviations like n,ne and nex
" 	:syntax match xIdentifier /\<\l\+\>/ - matches any word only
" consisting of lowercase letters
" Note: keywords overrule other syntax items, hence we have if and then as
" keywords as defined above
" 	:syntax match xComment /#.*/ - comments starts with # til end of line
" see pattern for help on patterns
" 	:syntax region xString start=/"/ end=/"/ - matches a quoted string
" 	:syntax region xString start=/"/ skip=/\\"/ end=/"/ - skips also
" escaped double quotes in the string
" a match is a single pattern which must match as a whole
" when the item depends on the end pattern to match you cannot use a region
" 	:syntax keyword xTodo TODO contained
"	:syntax match xComment /%.*/ contains=xTodo
" first line tells Vim can exist only in another syntax item
" the next line has contains=xTodo in it indicating that the xTodo syntax
" element is inside it
" ~> the comment line as a whole is matches by xComment and made blue
" the word TODO inside of it is matched by xTodo and highlighted yellow
" (highlighting for xTodo was setup for this)
" 	:syntax region xBlock start=/{/ end=/}/ contains=xBlock - defines
" blocks in curly braces
" 	:syntax region xComment start=/%/ end=/$/ contained
"	:syntax region xPreProc start=/#/ end=/$/ contains=xComment
" with the following code:
" 	#define X = Y  % Comment text ~
" 	int foo = 1;
" with end=/$/ the preprocessor directive should end at the end of the line
" but after thencomment ends the preprocessor directive continues
" to avoid this use the keepend argument:
" 	:syntax region xComment start=/%/ end=/$/ contained
" 	:syntax region xPreProc start=/#/ end=/$/ contains=xComment keepend
" 	:syntax region xList start=/\[/ end=/\]/ contains=ALL - causes an
" endless loop, since the irem contains itself
" :syntax region xList start=/\[/ end=/\]/ contains=ALLBUT,xString - includes
" all items and don't have a contained argument. contained is used only to
" include items with a contained agrument, see :syn-contains
" look at the code snipet: if (condition) then 
" 	:syntax match xIf /if/ nextgroup=xIfCondition skipwhite
" 	:syntax match xIfCondition /([^)]*)/ contained nextgroup=xThen skipwhite
" 	:syntax match xThen /then/ contained
" nextgroup arguemnt specifies which item can come next (not required)
" in [if not (condition) then] only if is highlighted since not doesn't match
" the nextgroup
" you can also use skipwhile to skipt whitespaces or skipnl or skipempty to
" skip new and empty lines
" :syntax region xInside start=/(/ end=/)/ - highlights everything inside ()
" :syntax region xInside matchgroup=xParen start=/(/ end=/)/ - highlights
" start and end with a different highlight group
" :syntax region xInside matchgroup=xParen start=/(/
"		\ matchgroup=xParenEnd end=/)/
" side effect of matchgroup is that contained items will not match in start or
" end of a region, see transparent for an example
" highlight a for() diffenrently than while():
" 	:syntax region cWhile matchgroup=cWhile start=/while\s*(/ end=/)/
" 		\ contains=cCondNest
" 	:syntax region cFor matchgroup=cFor start=/for\s*(/ end=/)/
" 		\ contains=cCondNest
" 	:syntax region cCondNest start=/(/ end=/)/ contained transparent
" now you can give cWhile and cFor different highlighting cCondNest can appear
" in either of them but takes overe the highlighting of the item it is
" contained in (transparent argument causes this)
" Notice: side effect of a matchgroup: contained items are not found in the
" match with the start item ~> avoids that cCondNest group matches the ( just
" after the while of for
" :syntax region xCond start=/if\s*(/ms=e+1 end=/)/me=s-1 - offset for the
" start pattern is ms=e+1. ms = match start. e+1 match starts at the end of
" the pattern match and then one character back
" thus in if (foo == bar) only foo == bar is highlighted as xCond; see
" :syn-pattern-offset
" :syntax region xIfThen start=/if/ end=/then/ oneline - match only in one
" line
" 	:syntax region xPreProc start=/^#/ end=/$/ contains=xLineContinue
" 	:syntax match xLineContinue "\\$" contained
" # starts the preprocessor line and \ allows for line continuation
" this matches the code example:
" 	#define SPAM  spam spam spam \
" 			bacon and spam
" to avoid making the xPreProc continue on the next line use excludenl:
" 	:syntax region xPreProc start=/^#/ end=/$/
" 		\ contains=xLineContinue,xPreProcEnd
" 	:syntax match xPreProcEnd excludenl /end$/ contained
" 	:syntax match xLineContinue "\\$" contained
" note: excludenl is placed before the pattern
" a collection of syntax groups is called a cluster
" suppose a language with for/while loops, if statements and functions. Each
" of them contains the same syntax elements: numbers and identifiers:
" 	:syntax match xFor /^for.*/ contains=xNumber,xIdent
" 	:syntax match xIf /^if.*/ contains=xNumber,xIdent
" 	:syntax match xWhile /^while.*/ contains=xNumber,xIdent
" need to use contains= very often
" to define a cluster use:
" :syntax cluster xState contains=xNumber,xIdent - clusters are used like
" syntax groups, their names start with @
" 	:syntax match xFor /^for.*/ contains=@xState
" 	:syntax match xIf /^if.*/ contains=@xState
" 	:syntax match xWhile /^while.*/ contains=@xState
" :syntax cluster xState add=xString - adds new group names to the cluster
" :syntax cluster xState remove=xNumber - removes a syntax group
" :runtime! syntax/c.vim - reads in C language definition for C++ syntax
" :syntax keyword cppStatement	new delete this friend using - adds C++ syntax
" you can also use Pearl...
" :syntax sync ccomment - scans back from editing point to a C-style comment
" :syntax sync ccomment minlines=10 maxlines=500 - minlines backward, maxlines
" maximum number of lines to scan
" :syntax sync minlines=150 - go back 150 lines and start parsing from there
" for more about synchronization see :syn-sync
" for our x language the file would look like ~/.vim/syntax/x.vim ~
" you must also make the file type be recognized see 43.2
" for portable syntax file layout there are some guidelines
" 45
" :language - see the current language
" :version - must output +gettext and +multi_lang for using different
" languages
" env LANG=de_DE.ISO_8859-1  vim - only works if the language is availible on
" your system
" :language fr_FR.ISO_8859-1 - change language inside Vim
" if translated messages are not availible Vim will fall back to English
" see :language
" you can also do the translation by yourself
" :set langmenu=nl_NL.ISO_8859-1 - change language of the menu; see langmenu
" once the menus are defined the langmenu has no effect, so you have to
" resource:
" 	:source $VIMRUNTIME/delmenu.vim
" 	:set langmenu=de_DE.ISO_8859-1
" 	:source $VIMRUNTIME/menu.vim
" drawback: user defined menus are gone, you'll need to redefine them
" in $VIMRUNTIME/lang/menu_{language}.vim - is a menu translation file, you
" can copy and modify it for your own needs
" you can also use other encoding for your files, standard is latin1
" see :language which has to contain multi_byte for different encodings
" start: USING UNICODE IN THE GUI
" setting unicode in gui-Vim:
" 	:set encoding=utf-8
" 	:set guifont=-misc-fixed-medium-r-normal--18-120-100-100-c-90-iso10646-1
" encoding are the settings for the internals of Vim
" in windows it is more complicated
" 	:let &termencoding = &encoding
" 	:set encoding=utf-8
" This assigns the old value of 'encoding' to 'termencoding' before setting
" encoding' to utf-8
"  xterm -u8 -fn -misc-fixed-medium-r-normal--18-120-100-100-c-90-iso10646-1 -
" you can also start an xterm with unicode (if compiled)
" you can also use unicdoe in an ordinary terminal but thats somehow
" complicated
" beware of setting encoding differently because of registers etc.
" you can also edit files with different encodings, standard is
" fileencodings=ucs-bom,utf-8,latin1 - ucs-bom are file internals, utf-8
" encoding and latin1 is 8bit encoding taht always works
" see encoding-values
" :edit ++enc=koi8-r russian.txt
" :write ++enc=utf-8 russian.txt
" convert the encoding of the file russian.txt
" note: conversion may result in lost characters
" to enter more characters (ie. Unicode) you can use digraphs (see 24.9)
" when you use more characters use an Input Method like mbyte-XIM for X Window
" systems or mbyte-IME for MS-Windows
" :set keymap=hebrew - type in Hebrew
" in input mode you are now in hebrew, however in command mode you switch back
" to English
" you can create your own keymap file see mbyte-keymap
" if you want to enter a special char see i_CTRL-V_digit for details
" 90
"















" 


"



"










