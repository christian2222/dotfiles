function InsertAtFirstMark()
	execute "normal i\<Plug>IMAP_JumpForward"
	"move one character right
	execute "normal l"
	" startinsert works like i in normal mode, with ! it works like A
	startinsert!
endfunction

function UsePhpTabs()
	setlocal tabstop=4
	setlocal softtabstop=0
	setlocal shiftwidth=4
	setlocal expandtab
	" set smarttab
	"call UseSpaces()
endfunction

function TestMe()
	echo "Hier ist ein Test"
endfunction


function CmSkeleton(extension)
	let choice = input("Load Skeleton? ","y")
	if(choice == "y")
		exec '0r ~/dotfiles/skeletons/skeleton.'.a:extension
		echom "loaded"
	else
		echo "notloaded"
	endif
endfunction

function CmAskQuestion()
	let choosen = input("Load Skeleton?", "y")
	if(choosen == "y")
		echom "loaded"
	else
		echo "notloaded"
	endif
endfunction

" from https://vi.stackexchange.com/questions/5780/list-known-filetypes
function GetFiletypes()
    " Get a list of all the runtime directories by taking the value of that
    " option and splitting it using a comma as the separator.
    let rtps = split(&runtimepath, ",")
    " This will be the list of filetypes that the function returns
    let filetypes = []

    " Loop through each individual item in the list of runtime paths
    for rtp in rtps
        let syntax_dir = rtp . "/syntax"
        " Check to see if there is a syntax directory in this runtimepath.
        if (isdirectory(syntax_dir))
            " Loop through each vimscript file in the syntax directory
            for syntax_file in split(glob(syntax_dir . "/*.vim"), "\n")
                " Add this file to the filetypes list with its everything
                " except its name removed.
                call add(filetypes, fnamemodify(syntax_file, ":t:r"))
            endfor
        endif
    endfor

    " This removes any duplicates and returns the resulting list.
    " NOTE: This might not be the best way to do this, suggestions are welcome.
    return uniq(sort(filetypes))
endfunction

function ListFileTypes() 
	for f in GetFiletypes() 
		echo f
       	endfor
endfunction
