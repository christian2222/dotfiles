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


