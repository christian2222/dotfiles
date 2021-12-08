" some latex stuff
augroup LatexStuff
	" remove previously defined autocommands, so they are not loaded
	" multiply times (cannot be placed in the same line sinde autocmd! is
	" a vimscript command!
	autocmd!
	" note the difference betwenn FileType which is a vim interna and 
	" *.tex which is a wildcard for file types!
	autocmd FileType tex inoremap dthm <Bslash>begin{thm}<CR><CR><Bslash>end{thm}<Up>
	autocmd BufNewFile *.tex call CmSkeleton('tex')
	autocmd BufNewFile *.tex call InsertAtFirstMark()
	autocmd FileType tex inoremap ddef <Bslash>begin{defi}<CR><CR><Bslash>end{defi}<Up>
	autocmd FileType tex inoremap dlem <Bslash>begin{lem}<CR><CR><Bslash>end{lem}<Up>
	autocmd FileType tex inoremap dkor <Bslash>begin{kor}<CR><CR><Bslash>end{kor}<Up>
	autocmd FileType tex inoremap dbem <Bslash>begin{bem}<CR><CR><Bslash>end{bem}<Up>
	autocmd FileType tex inoremap dpro <Bslash>begin{proof}<CR><CR><Bslash>end{proof}<Up>
	autocmd FileType tex inoremap ddoc <Bslash>documentclass{article}<CR><Bslash>begin{document}<CR><CR><Bslash>end{document}<Up>
	autocmd FileType tex inoremap öö <bslash>
	autocmd FileType tex inoremap mP <Bslash>mathbb{P}()<left>
	autocmd FileType tex inoremap mA <Bslash>mathbb{A}()<left>
	autocmd FileType tex inoremap mE <Bslash>mathbb{E}()<left>
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


augroup PhpStuff
	autocmd!
	"autocmd BufWrite, FileWritePre, BufRead, BufNewFile *.php	call TestMe()
	autocmd BufRead *.php 		call UsePhpTabs()
	autocmd BufNewFile *.php	call CmSkeleton('php')
	autocmd BufNewFile *.php	call InsertAtFirstMark()
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

augroup PhpLaravelStuff
	autocmd!
augroup end

augroup HtmlStuff
	autocmd!
	" read a skeleton for a new file -- see :help skeleton
	" stack autocmds to execute them one after another, however it's cleaner to call a function
	" autocmd BufNewFile *.html	0r ~/dotfiles/skeletons/skeleton.html
	" replaced by function call
	autocmd BufNewFile *.html call CmSkeleton('html')
	autocmd BufNewFile *.html	call InsertAtFirstMark()
	" faster than call IMAP_Jumpfunc('', 0) and API compatible
	" call IMAP_JumpForward() instead of <C-j> which is binded to this fundtion
	" for more information see :map and look for IMAP-JumpForward
	autocmd FileType html inoremap Html <html><cr><head><cr></head><cr><body><cr></body><cr></html>
	autocmd FileType html inoremap dic <div class=""><cr><cr></div><cr><Up><Up><Up><Esc>A<Esc><Left>i
	autocmd FileType html inoremap gg {{  }}<Left><Left><Left>
	" b move to begin of word
	" yw yank word to paste it later
	" A move to end of line (in insert mode)
	" p paste content after
	" ?> search for last >
	" :noh disable last highlight search
	" => surround current typed word as html-tag and put yourself inside
	" of it in isert mode
	autocmd FileType html inoremap TT <Esc>bywi<<Esc>A></<Esc>pA><Esc>?><cr>:noh<cr>a
	" create a tag with class attribute
	autocmd FileType html inoremap TC <Esc>bywi<<Esc>A<space>class=""><++></<Esc>pA><Esc>?"<Cr>:noh<Cr>i
augroup end

" some bash shortcuts
" Skripting Stuff
augroup SkriptStuff
	autocmd!
	autocmd FileType sh inoremap ati apt-get install<Space>
	autocmd FileType sh inoremap SHE #!/bin/bash
augroup end

augroup JavaStuff
	autocmd!
	autocmd BufNewFile *.java	call CmSkeleton('java')
	autocmd BufNewFile *.java	call InsertAtFirstMark()
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

augroup AllFiles
	autocmd!
augroup end


