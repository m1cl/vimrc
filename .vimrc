"--general----------------------------------------------
set noswapfile
set splitright
set number
syntax on
colorscheme miVim 
set backspace=indent,eol,start
set showtabline=1
set nobackup
"set mouse=a
let maplocalleader = ","
set hlsearch
set incsearch
set nowb
set lbr
set wildmenu
set nowrap
set tabstop=2
set foldmethod=syntax
set hlsearch
set lbr
set shiftwidth=2
set backupdir=~/.vim/backup//
set laststatus=2
"set statusline=%<%f%m\ %{getcwd()}\ %=\ Line:%l\/%L\ Column:%c%V
set directory=~/.vim/swap//
set undodir=~/.vim/undo//       
set nocompatible              
"set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set statusline=\ %t\ %=\col:%c\ %=\%l/%L\ \[%M%R%H%W%Y]
set statusline+=%{ChangeStatusLineColor()}
filetype off                 
set rtp+=~/.vim/bundle/Vundle.vim
if has("clipboard")
	set clipboard=unnamed " copy to the system clipboard
	if has("unnamedplus") " X11 support
		set clipboard+=unnamedplus
	endif
endif
augroup javascript_folding
	au!
	au FileType javascript setlocal omnifunc=tern#Complete
	au FileType javascript setlocal foldmethod=syntax
augroup END
autocmd FileType typescript setlocal completeopt+=menu,preview
autocmd FileType R setlocal completeopt+=menu,preview
autocmd FileType qf nnoremap <buffer> <CR> <CR>
autocmd BufNewFile,BufRead *.jl set syntax=julia
autocmd BufNewFile,BufRead *.jl set ft=julia
"-----------------------------------------------end---

"--gui--------------------------------------------------
if has('gui_running')
	set guioptions-=m  "menu bar
	set guioptions-=T  "toolbar
	set guioptions-=r  "scrollbar
	set guifont=IBM\ PLEX\ Mono\ SemiBold\ 16
	set  visualbell t_vb=
	set noerrorbells                                                  "turn off the sound
endif
"-----------------------------------------------end---

call vundle#begin()
"--plugins--------------------------------------------
Plugin 'iago-lito/intim'
Plugin 'jalvesaq/nvim-r'
Plugin 'tpope/vim-fugitive'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'ruanyl/vim-fixmyjs'
Plugin 'eslint/eslint'
Plugin 'quramy/tsuquyomi'
Plugin 'leafgarland/typescript-vim'
Plugin 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plugin 'othree/yajs.vim'
Plugin 'isruslan/vim-es6'
Plugin 'jason0x43/vim-js-indent'
Plugin 'spf13/vim-autoclose'
Plugin 'shougo/vimproc.vim'
Plugin 'molok/vim-smartusline'
Plugin 'nlknguyen/papercolor-theme'
Plugin 'w0rp/ale'
Plugin 'chrisbra/csv.vim'
Plugin 'shougo/echodoc'
Plugin 'junegunn/fzf'
Plugin 'othree/html5.vim'
Plugin 'mattn/emmet-vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'julialang/julia-vim'
Plugin 'jpalardy/vim-slime'
Plugin 'majutsushi/tagbar'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'manasthakur/vim-commentor'
Plugin 'ervandew/screen'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-surround'
"-----------------------------------------------END---
call vundle#end()            

"--shortcuts -----------------------------------------
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-p> c<ESC>"+p
imap <C-p> <ESC>"+pa
tmap <ESC><ESC> <C-bslash><C-N><ESC><ESC>
tnoremap <Esc> <C-W>N
tnoremap <M-BS>   <C-\><C-n><C-W>
tmap <F4> <C-bslash><C-N><C-w><C-r>
tmap <C-h> <C-bslash><C-N><C-w><C-h>
nnoremap <F2> :w! <CR> :Fix <CR> 
nnoremap <F3> :w! <CR> :source ~/.vimrc <CR> :!PluginClean <CR> :PluginInstall <CR>
nnoremap <F4> :call OpenConfigFile() <CR>
nnoremap <F5> :call OpenTerminalVertically("screen -s R") <CR>                                                            "Change between colorschemes             <F5>
nnoremap <silent><F6> :call ChangeColorScheme("PaperColor", "miVim")<CR>"                                                 "change colorscheme                      <F6> 
nnoremap <silent><F7> :call Rename()<CR>                                                                                  "Rename file                             <F7>
nnoremap <F8> :w!<CR>:Fixmyjs<CR>                                                                                         "Run Fixmyjs (eslint)                    <F8>
nnoremap <F9> :call SendToTerminal("yarn test\n") <CR>
nnoremap <F10> :call OpenRepl() <CR>
nnoremap <C-s> :ScreenSend <CR>
vnoremap s :ScreenSend <CR>
nnoremap s V :ScreenSend<CR>
nnoremap S :ScreenSend<CR>
inoremap <C-s> <ESC> V :call SendCurrentLineToScreen()<CR>i
"vnoremap V :ScreenSend <CR> j
nnoremap <C-u> :call UnitTest() <CR>
nnoremap <C-B> :FZF <CR>
nnoremap <ESC><ESC> :q!<CR>
nnoremap <ENTER> :w!<CR>
nnoremap <SPACE><ENTER> :w! <CR> :source %<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>
inoremap <c-l> <right>
nnoremap <SPACE> /
nnoremap <SPACE><SPACE> :noh<CR> 
nnoremap H gT
nnoremap L gt
nnoremap vv bve
nnoremap <B> setlocal shortmess+=c
nnoremap <TAB> ]`
nnoremap <S-TAB> k[` 
inoremap <C-a> <ESC> :normal $ <CR>a
inoremap {<ENTER> {<ENTER>}<ESC>O
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
vnoremap <C-d> "+d
nnoremap term :call OpenTerminalVertically("lsd") <CR>
nnoremap repl :call OpenRepl()<Cr>
"-----------------------------------------------END---

"--3rd party -----------------------------------------
let g:UltiSnipsExpandTrigger="<C-j>"
let g:user_emmet_expandabbr_key = '<C-f>'
let g:fixmyjs_engine = 'eslint'

" YouCompleteMe settings
let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_server_python_interpreter = '/usr/bin/python2.7'
"let g:ycm_key_list_stop_completion = ['<C-f>']
"let g:ycm_key_list_stop_completion = ['<tab-f>']

"vim-R settings
let g:R_nvimpager="horizontal"
let g:R_rconsole_width = 0 

let g:ScreenImpl = 'GnuScreen'
"-----------------------------------------------END---

"--scripts -------------------------------------------
fun! OpenConfigFile()
	let bufnr = bufwinnr(".vimrc")
	if bufnr > 0
		bd ".vimrc" 
	else
		tabe /home/m1cl/.vimrc
	endif
endfun
fun! OpenRepl()
	let options =  { 'term_cols': 42, 'vertical': 1 }
	if &filetype == 'python'
		let bn = term_start("screen -s python", options)
	elseif &filetype == 'r' 
		let bn = term_start("screen -s R", options)
		vert resize -30
	elseif &filetype == 'javascript' 
    vertical terminal screen -s node
		let bn = term_start("screen -s node", options)
		vert resize -30
	elseif &filetype == 'julia' 
		let bn = term_start("screen -s julia", options)
	endif
	call term_sendkeys(bn, "\<C-w>")
	exe "wincmd h"
	ScreenShellAttach
endfun
fun! OpenTerminalVertically(cmd)
	let options =  { 'term_cols': 42, 'vertical': 1 }
	let bn = term_start("fish", options)
	call term_sendkeys(bn, "\<C-l>")
	call term_sendkeys(bn, a:cmd . "\n")
	call term_wait(bn)
endfun
fun! OpenTerminal(cmd)
	let options =  { 'term_rows': 16 }
	let bn = term_start("fish", options)
	call term_sendkeys(bn, "clear\n" . a:cmd . "\n")
	call term_wait(bn)
endfun
fun! UnitTest()
	if exists('g:ScreenShellSend')
		call g:ScreenShellSend("npm test\n")
	endif
endfun
fun! Rename()
	let filename = input('new file name: ')
	let currentFile = expand('%:p')
	let currentPath = getcwd() 
	echo "\n"
	let path = expand('%:h')
	echom escape(path, '') 
	execute 'cd ' . path
	execute 'saveas ' . filename
	execute '!rm ' . currentFile
	execute 'cd ' . currentPath
endfun
fun! SendCurrentLineToScreen()
	if !g:ScreenShellActive 
		ScreenShellAttach
	endif
	if getline(".") != ""  
		normal V s 0
	endif
endfun
fun! OpenTerminalTab()
	tabe terminal
	terminal "fish"
	normal <C-w>w
	normal :q <CR>
endfunc
"-----------------------------------------------END---

so /home/m1cl/.vim/scripts.vim
filetype plugin indent on    
