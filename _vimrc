" New vimrc by Vinicius Canto Xavier

" Startup things
set nocompatible
filetype off
"Calling Vundle to setup plugins
set rtp+=~/vimfiles/bundle/Vundle
call vundle#rc('~/vimfiles/bundle')

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" { Plugins via Git
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'

Plugin 'scrooloose/nerdtree' 
Plugin 'altercation/vim-colors-solarized' 
Plugin 'spf13/vim-colors' 
Plugin 'tpope/vim-surround' 
"Plugin 'tpope/vim-repeat' 
Plugin 'jiangmiao/auto-pairs' 
Plugin 'ctrlpvim/ctrlp.vim' 
Plugin 'tacahiroy/ctrlp-funky' 
"Plugin 'kristijanhusak/vim-multiple-cursors' 
"Plugin 'vim-scripts/sessionman.vim' 
Plugin 'matchit.zip' 

"Plugin 'bling/vim-bufferline' 
Plugin 'Lokaltog/vim-easymotion' 
"Plugin 'jistr/vim-nerdtree-tabs' 
Plugin 'flazz/vim-colorschemes' 
"Plugin 'mbbill/undotree'     54634
Plugin 'nathanaelkane/vim-indent-guides' 
"Plugin 'mhinz/vim-signify' 
"Plugin 'tpope/vim-abolish.git' 
"Plugin 'osyo-manga/vim-over' 
Plugin 'kana/vim-textobj-user' 
Plugin 'kana/vim-textobj-indent' 
"Plugin 'gcmt/wildfire.vim' 

Plugin 'scrooloose/syntastic' 
"Plugin 'mattn/webapi-vim' 
"Plugin 'mattn/gist-vim' 
Plugin 'scrooloose/nerdcommenter' 
"Plugin 'tpope/vim-commentary' 
"Plugin 'godlygeek/tabular' 
"if executable('ctags') 
"    Bundle 'majutsushi/tagbar' 
"endif 

Plugin 'bling/vim-airline'

" }

"from now, importing all options from mswin.vim. In the future I'll narrow
"down the options I need.
source $VIMRUNTIME/mswin.vim

"sets syntax highlight on
syntax on
filetype plugin on
filetype plugin indent on "see set autoindent in this file

" { === Plugin Options ===
"

 let g:airline_powerline_fonts = 0

" }

" {  === GUI Options ===
"preferred color schemes, in order
if has("gui_running")
	"programming fonts
	"colorscheme ir_black
	colorscheme desert
	colorscheme wombat

	"for presenting
	"colorscheme murphy

	"sets the window size
	set lines=35
	set columns=130

	"Hiding toolbar and menu bar
	set guioptions=eh "rb
	"in case of emergency
	"m == menu
	"r == vert scroll bar
	"b == horiz scroll bar

	"disabling ALT behavior
	set winaltkeys=no

	"improves speed reading
	set linespace=3

	"Fonts for graphics. Requires antialiasing (Clear Type) on
	if has("win32")
		set gfn=Lucida_Console:h10
		set gfn=Consolas:h11
	else
		set gfn="Bitstream_Vera_Sans_Mono":h10:cANSI "for Linux compat
	endif
else "for console mode
	colorscheme slate
	set bg=dark
endif

"trying to set Inconsolata, bug using Consolas as a fallback
"silent! set guifont=Inconsolata_for_Powerline:h13
"if &guifont != 'Inconsolata_for_Powerline:h13'
"    set guifont=Consolas:h13
"endif

" turn off swap files. They rarely help me to save lifes
set noswapfile

" sets the cursorline. warning: may cause lags
set cursorline

"setting TAB behavior in command mode
"http://vim.wikia.com/wiki/Great_wildmode/wildmenu_and_console_mouse)
set wildmenu
set wildmode=list:longest,full


"showing special characters easily
set listchars=trail:.,tab:._
set list

"show statusline by default
set laststatus=2

"enabling block selection even on spaces that don't have characters.
"See help.
set virtualedit=all

"Setting Status line options; See help for more info.
set statusline=%<%f\ %6.h%m%r[%{&fileencoding}][%{&fileformat}]%=A:%03.b\ H:0x%02.B\ Lin:%l\ Ch:%c\ Col:%v\ %P

"Setting default split to vertical
set splitright


"Setting the height of command bar
set cmdheight=2

"Setting to always show tab line
set showtabline=1


" }

" { === General options ===
"Configurando a codificação dos arquivos
set encoding=utf-8
set termencoding=utf-8 "algumas vezes pode colocar utf-8, dependendo do SO.

"automatic folding configuration. Extremely personal settings
"quick tip: zR unfolds everything
set foldmethod=indent
set foldcolumn=0
set foldminlines=10
"
" }

" { === Editing Options ===

" turn off automatic line wrap. See keyboard shortcuts
set nowrap

" turn on autoindent
set autoindent

" tab default behavior. file extensions may redefine it
set shiftwidth=5 "tab size for indenting
set tabstop=5 "real tab size in characters

"configures the default backspace behavior
set backspace=indent,eol,start whichwrap+=<,>,[,]

"show line numbers
set number

"default search options
set hlsearch "see keyboard shortcuts in this doc
set ignorecase
set incsearch

"Moving lines like in Office
nnoremap <S-A-j> :m+<CR>==
nnoremap <S-A-k> :m-2<CR>==
inoremap <S-A-j> <Esc>:m+<CR>==gi
inoremap <S-A-k> <Esc>:m-2<CR>==gi
vnoremap <S-A-j> :m'>+<CR>gv=gv
vnoremap <S-A-k> :m-2<CR>gv=gv

" }

" { Keyboard Mappings ===

" Space movement
nmap <space> <C-f>
nmap <S-space> <C-b>
nmap <C-space> 15zl
nmap <C-S-space> 15zh

" Essential commands
nmap ; :
imap jj <Esc>

"{" Numeric key mappings

" insert mode
imap <Esc>Oq 1
imap <Esc>Or 2
imap <Esc>Os 3
imap <Esc>Ot 4
imap <Esc>Ou 5
imap <Esc>Ov 6
imap <Esc>Ow 7
imap <Esc>Ox 8
imap <Esc>Oy 9
imap <Esc>Op 0
imap <Esc>On .
imap <Esc>OQ /
imap <Esc>OR *
imap <Esc>Ol +
imap <Esc>OS -

"normal mode
nmap <Esc>Oq 1
nmap <Esc>Or 2
nmap <Esc>Os 3
nmap <Esc>Ot 4
nmap <Esc>Ou 5
nmap <Esc>Ov 6
nmap <Esc>Ow 7
nmap <Esc>Ox 8
nmap <Esc>Oy 9
nmap <Esc>Op 0
nmap <Esc>On .
nmap <Esc>OQ /
nmap <Esc>OR *
nmap <Esc>Ol +
nmap <Esc>OS -
"}

"{ Space Key Mappings
nmap <space> <C-d>
nmap <S-space> <C-u>
vmap <SPACE> <C-d>
vmap <S-SPACE> <C-u>
"}

" { Function keys in any mode

"F1 -- Help
"F2 -- Open File
"F3 -- Save
"F4 -- Close (:q)
"F5 -- New Tab.
"F6 -- Next Tab
"Shift + F6 -- Prev Tab

nmap <F1> :tab help<space>
nmap <S-F1> :tab help<CR>

nmap <F3> :if expand("%") == ""<Bar>browse w %:p:h<Bar>else<Bar>w<Bar>endif<CR>
imap <F3> <C-o><F3>

nmap <F4> :q<CR>
nmap <C-S-F4> :qall!

nmap <F5> :tabnew<CR>
imap <F5> <ESC>:tabnew<CR>

nmap <F6> <C-w><C-w>
imap <F6> <C-o><C-w><C-w>
nmap <C-F6> :tabnext<CR>
nmap <C-S-F6> :tabprevious<CR>





nmap <F11> :set hlsearch!<cr>

" toggle nowrap mode
map <silent><F12> :call ChooseWrap()<CR>
"{ function that toggles wrapmode
function! ChooseWrap()
	if &wrap
		call DisableDisplayWrapping()
	else
		call EnableDisplayWrapping()
	endif
endfunction
function! EnableDisplayWrapping()
	if !&wrap
		setlocal wrap
		set wrap
		set lbr

		" don't skip wrapped lines
		nnoremap <buffer> <Up> gk
		nnoremap <buffer> <Down> gj
		inoremap <buffer> <Up> <C-O>gk
		inoremap <buffer> <Down> <C-O>gj
	endif
endfunction
function! DisableDisplayWrapping()
	if &wrap
		setlocal nowrap
		set nowrap
		set nolinebreak

		nunmap <buffer> <Up>
		nunmap <buffer> <Down>
		iunmap <buffer> <Up>
		iunmap <buffer> <Down>
	endif
endfunction
"}

"}

"{ insert mode mappings
imap <C-backspace> <C-w>
imap <C-delete> <C-o>dw
imap <S-Enter> <C-o>O<Esc>ji
imap <C-Enter> <C-o>o<Esc>ki

imap <C-S-j> <down>
imap <C-S-k> <up>
imap <C-S-l> <right>
imap <C-S-h> <left>

imap jj <ESC>

imap <C-F> <ESC>gUiw`]a
"}

"{ Normal Mode Mappings
nmap <S-Enter> O<Esc>j
nmap <C-Enter> o<Esc>k
nmap <C-S-Enter> i<CR><ESC>

nmap <C-j> 4zh
nmap <C-k> 4zl

nmap Y y$
nmap ; :
"}

" }


" { === User-defined functions ===
"
command Cdhere :cd %:h

"
" }

"modeline para configurar opÃ§Ãµes especÃ­ficas para esse arquivo
" vim:fdm=marker foldminlines=0 foldmarker={,}
