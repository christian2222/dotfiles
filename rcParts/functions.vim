function InsertAtFirstMark()
	execute "normal i\<Plug>IMAP_JumpForward"
	"move one character right
	execute "normal l"
	" startinsert works like i in normal mode, with ! it works like A
	startinsert
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

