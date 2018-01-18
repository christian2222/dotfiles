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
" INSERT-mode
" ***********
" some latex stuff
inoremap dthm <Bslash>begin{thm}<CR><CR><Bslash>end{thm}<Up>
inoremap ddef <Bslash>begin{defi}<CR><CR><Bslash>end{defi}<Up>
inoremap dlem <Bslash>begin{lem}<CR><CR><Bslash>end{lem}<Up>
inoremap dkor <Bslash>begin{kor}<CR><CR><Bslash>end{kor}<Up>
inoremap öö <bslash>
inoremap binfty \bigcup_{i=1}^\infty
" get rid of 5 keystrokes and replace them with <C-s>
inoremap <C-s> <esc>:w!<cr>a
inoremap <C-q> <Esc>:q<cr>
inoremap <C-l> <Esc>:wq<cr>
inoremap eqn <Bslash>begin{eqnarray*}<CR><CR><Bslash>end{eqnarray*}<Up>
" inoremap <esc> <nop> " force yourself to use jk 
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
echo funcs[1](['a', 'b', 'c'], 1)
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
" A - insert mode at the end of the line
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
" 9k - move 9 lines up
" 3A<pattern> - add 3 times the pattern at the end of line
" 3x - delete 3 characters
" ZZ - write the file and exit (no backup file is created - can be changed
" :q! - quit without saving
" : -command line mode
" q - quit the file
" ! - force to quit
":e! - reload the original version of the current file
":help - get help
" cttrl-] - follow a link (under the cursor) in the vim help 
" ctrl-t,ctrl-o - jump back from/to last link
" <ctrl+altgr+]> - follow links in help
" :help x - help to deleting chars
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
" windows commands all start with ctrl-w
" :h ctrl-w_p - help at moving to previous window
" :h windows.txt - general window help
" :helpgrep topic - grep all helpfiles for a specific topic and takes you to
" the first match
" :cnext - takes you to the next match
" :copen - opens the quickfix-window where all matches are availible
" :help usr-toc.txt - user manual
" :help usr_24.txt - chapter 24 of user manual
" :help 10.1 - go to chapter 10.1 in usr_10.txt
" :h hl-WaningMsg - WarningMsg highlightgroup
" :h :syn-conceal - help about the conceal argument for syn command
" quickfix commands start with :c and list commands with :l
" :h -f - help on command line switch f
" :h +conceal - help on optional feature conceal
" :h :help BufWinLeave - autocomands by their name
" :help autocommands-events
" :help ft-c-syntax - filetype specific c syntax
" :h ft-php-omni - omnicompletion in php
" :h ft-tex-plugin - tex plugin informations
" :h W10 - help on warning 10: Changing a readonly file
" :h E128 - takes you to function, because there the error occurs
" move on with :h usr_03.txt
" w - start of next word
" b - start of previous word
" 3w - move 3 words forward
" 2b - move 2 words backward
" e - move to next end of a word
" ge - move to previous end of word
" what vim detects as a word is set in the option 'iskeyword'
" B,W,E - like b,w,e but with special chars in word
" $ - move cursor to end of line, so A=$a
" ^ - move to first non-blank character of line
" 0 - move to the very first character of a line
" excercise: find out the difference between ^ and 0
      " in this example 
" 3$ does not make sence but works
" 0 takes no count because 0 is 0
" 3^ has no effect on ^
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
" ctrl-g - information where you are in file
" :set (relative)number - shows (relative) numbers on the left
" :set no(relaitive)number - turns this off again
" :set ruler - displays the cursor position in the lower right corner
" ctrl-u - move 'bild' up half screen
" ctrl-d - move 'bild' down half screen
" :!<cmd> - execute cmd on command line
" ctrl-e/y - scroll one line up or down
" ctrl-f/b - scroll full screen up or down
" zz - center line with cursor in window
" zb/t - cursor at line top or bottom
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
" :set hlsearch - option
" :set incsearch - search while you are typing
" :set nowrapscan - turns of stooping the search at begining or end of file
" the solder holding one of the chips melted and the
" /the$ finds the ar the end of line
" /^the finds the at the begining of line
" /c.m -matches com,cum,cam,...
" to match a real . escape it in search: /\.
" `` - come back to the mark where you came from
" note: ` is a jump itself
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
" ctrl-o - come back from where you started
" ctrl-i - jump forward (again)
" note: ctrl-i=<tab>
" :jumps - lists positions you jumped to
" d3w - delete the 3 following words
" d2e - exclusive delete two words
" d$ - delete til end of line
" note: first type an operator d then a motion $
" d4l - delete 4 chars; also an "operator-motion"
" c2wbe - change 2 words under cursor and insert be (note: space after is not deleted)
" cc - changes the whole line (here remaped to " )
" some shortcuts
" 	x  stands for  dl  (delete character under the cursor)
"	X  stands for  dh  (delete character left of the cursor)
"	D  stands for  d$  (delete to end of the line)
"	C  stands for  c$  (change to end of the line)
"	s  stands for  cl  (change one character)
"	S  stands for  cc  (change a whole line)
" d3w = 3dw expect that 3dw deletes a word 3 times
" 2d3w - deletes 6 words
" rx - replace character under cursor with x
" 5rx - replaces the 5 following characters with xxxxx
" 4r<enter> - replaces 4 characters with one line break
" . - repeat the last change command 
" To <B>generate</B> a table of <B>contents
" f>df>f<.f<. on the line above
" /four<enter>cwfive<esc>n.n. - repeat replacing four with five
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
" deleted text by d or x can be pasted back by p/P ("put") below/before
" 3p - paste 3 times
" type xp on the e of teh
" welp - 
" D - delete from cursor to end of line
" Copy(=yank) and paste
" ---------------------
" Y=yy - yanks the whole line
" P - puts before/above cursor
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
" ~ - change to upper/lower keys 
" :set tildeop - makes ~ to operator key
" I - insert mode after moving cursor to first non-blank character
" :edit $MYVIMRC - in home directory
" :set incsearch
" :set nocompatible
" $VIMRUNTIME/vimrc_example.vim - example vimrc file
" set backspace=indent,eol,start - allows <bs> to delete whitespace at start
" of a line, a line break and character before insert mode
" :set autoindent - keeps indent from previous line
" :set history=50 - keep 50 search patterns/commands in mind
" :set ruler - display cursor position in lower right corner (does not work
" since statusline was overriden)
" :set showcmd - display incomplete commands on status line; try with it 2f(w)
" map Q gq - a mapping
" vnoremap _g y:exe "grep /" . escape(@", '\\/') . "/ *.c *.h"<CR> - yanks the visually selected text and searches for it in C files
" 	if &t_Co > 2 || has("gui_running")
"	  syntax on
"	  set hlsearch
"	endif
" if more than 2 colors are availible and gui is running turn syntax
" highlighting on and set hlsearch
" filetype plugin indent on - 1) filetype detection 2) use filetype plugin
" files 3) use indent
" autocmd FileType text setlocal textwidth=78 - no longer lines than 78 chars
" in plain text files; only for onr file buffer
" 	autocmd BufReadPost *
"	    \ if line("'\"") > 1 && line("'\"") <= line("$") |
"	    \   exe "normal! g`\"" |
"	    \ endif
" after reading any file check if mark '" exists and jump to it if so
" \ can break a line command (works only in vimscript file)
" :help line-continuation
" :map <F5> i{<Esc>ea}<Esc> - set braces arounnd one word
" :map \p i(<Esc>ea)<Esc> - using backslash (has no function in vim)
" :map \c i{<Esc>ea}<Esc>
" :map - list all current mappings
" optional and automatically loaded packages
" :packadd! matchit
" :h matchit - after restart
" :h packages
" plugin - vimscript file loaded automatically
"     global plugin: Used for all kinds of files
"   filetype plugin: Only used for a specific type of file
" :h add-filetype-plugin
" :h load-plugins
" :h write-plugin
" :h vimrc-filetype
" :options - list of options
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
" :syntax enable - color your files by syntax
" :colorscheme evening
" Using registers
" "fyas - yank a sentence in the f register (a-z are registers) registers
" appear before! the yank command
" "l3Y - yank 3 lines in the l register
" <ctrl-V>jjww"by - yank a block of 2 lines and 2 words to b register
" notice: "b is before! the yanking y
" "fp - paste content of register f where the cursor is
" "wdaw - delete a word and write it in register w (register before! delete)
" :write => logfile - append text of teh current window to logfile (you can
" also use visual mode for this)
" :view file - opens file in read-only mode
" see options 'modifiable' and 'write'
" :sabeas move.c - saves the current file under the new name move.c
" splitting windows
" :new - opems a new empty file
" :(v)split file.txt - splits the window (vertically) and opens the file
" file.txt
" :3split alpha.c - opens alpha.c in a new window with heigt 3
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
" :qall - quit all windows
" :wall - write all windows 
" :wqall
" :qall!
" differences between files
" vimdiff file.one file.two
" editing file.onw and command :certical diffsplit file.two - splits window
" vertically and diffs them
" :set noscrollbind - to deactivate the parallel scrolling while diffing
" :diffupdate - to update the diff
"
" Tabs
" ****
" :tabedit file.one - create a new tab with file.one
" :tab help gt - shows help in a new tab
" gt/T - go to next/previous tab
" :help tab-page
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
" appended yanking
" ****************
" "aY - start yanking one line into register a
" "AY - yank another (independent) line into register a
" => register a now contains all lines in yanked order!
"
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
" /Chapter/+2 - adress 2 line after match (also works with negative numbers)
" :'t,'b - using text between the marks t(op) and b(ottom)
" :'<,'> - after visual mode these are actual marks selecting start and end of
" visual selection
" '>,$ - mix these marks with other items!
" 5: - mark the current and the next  lines (and do something)
" :[range]/global/[pattern]/[command] - find a match for a pattern and execute
" a command there - very powerful
" :g+//+s/foobar/barfoo/g - search pattern is included in +s then change
" foobar to barfoo in all commented lines
" :global - works on whole file without parameters
" :substitue - works on one line without parameters
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
" :read file.one - inserts file.one at current position
" :%r file.one - append file.one at end of file
" :0r file.one - insert file at beginning of current file
" :.,$write tempo - write current position til end of file to file tempo
" :.,$write! tempo - ! must follow immediately after write otherwise it would
" be a filter command
" :w >>new.txt - buffer is appended tii new.txt
" :set textwidth=72
" :set textwidth - returns current value
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
" vim -r ** - recover unsaved file (must be in the right directory)
" vim -r - list all swapfiles
" vim -r one.swp - use specific swap file
" for location use options 'dir' and 'shell'
" :help recovery
" :help swapfile
"
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
"
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
" g<ctrl-g> - count words
" :h count-items
" K - on one word: find man page for that word (ie. ls)
" :h find-manpage
" use :runtime! ftplugin/man.vim in your .vimrc
" 	now you can :Man 3 echo to get to section 3 of echo
" :%s/\s\+$// - find whitespace at end of line and delete it
" 		\s\+ is arbitrary many whitespace
" 		$ if end of line
" :h usr_27.txt - for patterns
" /<space><tab> - find spaces before tabs " vim `grep -l frame_counter *.c` - open all c files with frame_counter in it
" 				    ` producing a list of files to pass it to
" 				      vom
" use :next and :first to browse through files
" :grep error_string *.c - use :cnext and :cprev two swwitch between matched
" files, use :clist for overview
" note: :grep uses the external tool grep - see option 'grepprg'
"
" <<Editing Effeciently>>
" **************************
" move around in comman line
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
" :set a(uto)i(ndent)
" :h option-list
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
" :h viminfo
" start vim and press '0 - you right back where you were last time; see :h
" marks
" :h oldfiles
" :h sessionoptions
" :mksession vimbook.vim - stores a session to a file
" :source vimbook.vim - restores the session from file
" vim -S vimbook.vim - starts with given session
" :h sessionoptions
" views save only one windows not a complete session
" :mkview 1 - make a view called 1 (1-9)
" :loadview 1 - loads view 1
" :mkview main.vim - save a view into a file
" .source main.vim - load it from there
" :h modeline
" :edit . - starts the vim filebrowser (hit <f1> for help ctrl-j to jump in ctrl-o to jump back)
" :Explore <dir> - start filebrowser in current dir
" :h mewtr-browse - for more information
" vim has integrated file directories:
" :cd ... - change working directory to ...
" :pwd - print working director
" local directory - directory binded zo local window
" :lcd - change local diretory
" :h 'path'
" :find me.two - finds me.two in given paths
" g! - open file under cursor
" :buffers - see all buffers
" :buffer help
" :set fielformats=unix,dos
" :set fileformat? - prints actual file format
" :edit ++=>=unix file.txt - ++ff overrules fileformat to unix for file.txt
" let readme.txt be an ms-dos file format
" open readme.txt and 
" :set fileformat=unix
" :write
" writing the file in unix format
" on hyperlinks(http://,ftp://,scp://,rcp://) type gf to follow them
" ctrl-w f - open hyperlink in new window
" perhabs install wgett and scp
" see netrw
" vim -x file.one - encrypt file.one with entered encryption key
" :set key= - kill encryption on current file
" vim .x -n file.one - encrypt file.one without swapfile because swapfiles are
" not encrypted!
" :setlocal noswapfile - diables the swapfile
" remind: encryption of vim is not very good
" vim -h datafile - open dtafile binary
" :set display=uhex - comes in handy here
" g<ctrl-g> - see byte position in file
" 2345go - go to byte 2345
" vim -b datafile and after that :%!xxd to convert to binary view
" :%!xxd -f - convert it back
" see man xxd
" .Z.gz.bz2 - supported zip formats for vim
" 4blraA - 4 words back one char forward replace current char with o append at
" end of line
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
" :set showmatch - show corresponding ) if you type a ( and vice versa
" :set matchtime=15 - wait 1.5 seconds when matching
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
" see ins-completion
" 	CTRL-X CTRL-O 		omni compltion
" 				see compl-omni-filetypes
" "vyiw - yank register v to inner word
" "vyiw - yank register v to inner word
" remind: difference between iabbrev and imap
" <ctrl-v><esc> insert the key character in text here escape
" idea: get the coding of keys for mappings with <ctrl-v><key>
" <ctrl-k>Co - make the copyright symbol (a digraph)
" :digraphs - list all digraphs
" :digraph a" ä - define own digraph
" "g3dw - delete up to 3 words in register g
" :set textwidth=30
" :set wrap
" v4jgq - gq formats a paragraph
" see auto-format
" gq4j - same as above
" } - moves to the end of a paragraph
" gq} - format from the cursor to the end of a paragaraph
" gqap - ap stands for a paragraph
" note: paragraphs are separated by empty lines
" gggqG - gg move to first line gqG format til last line
" warning; a blank line is not an empty line
" see fo-table,joinspaces,formatprg
" :1,5center 40 - formats line 1-5 with textwidth  40
" :1,5right 37
" :1left 5 - in left 5 is the margin
" :packadd justify - now hit _j in visual mode (not build in!)
" :set autoindent - next line gets the same indent as previous line
" >> - indent the current line (> increases indent)
" 4>> - increase the indent of 4 lines
" :set shiftwidth=4 - change indent witdh
" :set softtabstop<04 - making the <tab> key insert 4 spaces of indent
" see 'expandtab','tabstop'
" :set tabstop=3
" :retab 	 - change tabstop to 8
" :set guioptions+=b - add a horizontal scrollbar
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
"	g$		to last visible character in this line
" :set linebreak
" gj/gk - move to a wrapping line below/above
" idea: bind these with mappings to arrow keys <up> and <down>
" :g/./,/^$/join - turn each paragraph into a single line
" 		   :g/./ globally find all ines with at least one character
"		   ,/^$/ range starting from the current to an empty line
"		   join  joins the range of lines together in one line
" :g/\S/,/^\s*$/join - this works with blank lines
" :set virtualedit=all - virtual space editing; makes editing tables easier
" BJ - move back to the start of a whitespace separated word
" note: use visual block mode for editing tables
" :set virtualedit> - deactivate virtual cursor movement
" gv . select the preselected text in visual mode
" :s/2001/2002/g - replace 2001 by 2002; type gv to reselect the same text
" /19[0-9][0-9]\|20[0-9][0-9] - press <ctrl-a> hence each year is increased by
" one
" n. - find the next match and do the same
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
" produceer | vim -S change.vim - - read input form producer
" vim -s script file.txt ... - - use file.txt commands in normal mode on
" another file
" 'magic' is on by default
" <ctrl-c> - interrupt a search
" :set ruler - show cursor position on the lower right (does not work here
" since statusline was overidden before)
" :set nowrapscan - now you get an error when search hits the top or bottom of
" file
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
"
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
" zm - folds all folds again
" zR/zM - for nested folds
" zn/N - dis/enable folding
" zi - toggle between (non)folding
" z0 - open all folds on cursor line
" zC - close all folds on cursor line
" zd - delete a fold on cursor line
" zD - delete all fold on cursor line
" :set foldopen=all - opens all folds as you roll over
" :set foldopen& - reset to default
" note: folding is local to window
" :mkview - save folds
" :loadview - load folds (and other 'viewoptions') again
" :set foldmethod=indent - fold by indent
" :set foldlevel=3 - all lines with 'shiftwidth 3 or more are folded
" zM - set foldlevel to 0
" zR - set foldlevel to the deepest
" see 'fold-indent','fold-marker','fold-syntax','fold-expr','fold-diff'
"
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
" usr_25.txt 29 RELATED
