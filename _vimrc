" vimrc by Vinicius Canto
" Versão 1.2.5
" Última Atualização: 16/08/2008

"testando funcionalidades
set foldmethod=indent
set foldcolumn=4
set foldminlines=10

"desativando o modo de compatibilidade com o vi
set nocompatible

"configurando os caracteres estranhos
set listchars=trail:.,tab:._
set list

"frescura: configurando um espaço extra de limite quando for dar um scroll.
"bom, é difícil explicar isso... veja no help
set scrolloff=5

"configurando pra sempre aparecer a statusline
set laststatus=2

"liberando a seleção em bloco mesmo que não exista caractere na posição que eu
"quero. see help for more
set ve=block,onemore

"Configurando tudo que deve aparecer na minha statusline
set statusline=%<%f\ %6.h%m%r[%{&fileencoding}]%=A:%03.b\ H:0x%02.B\ Lin:%l\ Ch:%c\ Col:%v\ %P

"Configurando o split padrão para vertical
set splitright

"Configurando a codificação dos arquivos
set encoding=utf-8
set termencoding=latin1 "algumas vezes pode colocar utf-8

"Configurando a altura da barra de comandos
set cmdheight=3

"Configurando a linha de tabs
set stal=2

"carregando esquema de cores

if has("gui_running")
	"melhor para programar
	colorscheme desert

	"melhor para programar 2
	"colorscheme slate

	"melhor para apresentações
	"colorscheme murphy

	"Configurando a área da tela
	set lines=38
	set columns=106
	"winpos 75 121 não quero mais essa m...

	"configurando o que vai aparecer na interface gráfica
	set go=eimrbh

	"certificando que o ALT não vai ser usado pra nada
	set winaltkeys=no

	"frescura: aumentando o espaço entre as linhas na interface gráfica
	set linespace=2

	"configuração da fonte no modo gráfico
	if has("win32")
		set gfn=Lucida_Console:h13:cANSI
		set gfn=Consolas:h13:cANSI
		"set gfn=Lucida_Sans_Typewriter:h12:cANSI
	else
		set gfn="Bitstream_Vera_Sans_Mono":h10:cANSI
	endif
else
	colorscheme slate
	set bg=dark
endif


"desliga quebras de linha automáticas
set nowrap

"mostra a régua, mostrando o posicionamento na tela no canto esquerdo
set ruler

"indentacao automagica
set autoindent

"ft on
filetype plugin on
filetype plugin indent on

"nivel de indentacao
set shiftwidth=5                "tamanho do >> << e cident
set tabstop=5                   "tamanho do tab msm
"deixe esses dois números iguais pra travar o TAB pra tudo

"configura o backspace corretamente
set backspace=indent,eol,start whichwrap+=<,>,[,]

"numeracao do lado esquerdo
set number

"syntax highlighting
syntax on

"opções que tornam a busca mais interessante...
set hlsearch
set ignorecase
set incsearch

"opções que eu não conheço ainda
set nocp
set title
set ttyfast

"tentando fazer meu Shift + setinhas funcionarem... like MS Notepad
set sel=exclusive
set slm=mouse,key
set cb=
set km=startsel,stopsel


"mapeamentos do teclado numerico no modo de insercao
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

"mapeamentos do teclado numerico no modo normal
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

"mapeamentos do modo inserção
imap <C-backspace> <C-w>
"imap <C-backspace> <C-o>db<backspace>
imap <C-delete> <C-o>dw


"mapeamento de teclas de função

"F1 -- Help. Interno do VIM
"F2 -- Abrir arquivo usando janelas
"F3 -- Salvar arquivo usando janelas
"F4 -- Fechar usando :q
"F5 -- Nova tab.
"F6 -- Próxima Tab
"Shift + F6 -- Tab Anterior
"F12 -- Alterna entre modo normal e modo "notepad", ativando o wrap e o lbr


"mapeamentos simples
map <F2> :e
map <S-F2> :Te<CR>
map <C-F2> :E<CR>
map <F3> :if expand("%") == ""<Bar>browse confirm w<Bar>else<Bar>confirm w<Bar>endif<CR>
map <F4> :q<CR>

"mapeando F5, F6 e S-F6 para usar com tabs no Vim7
let g:toggleTabs = 1
set guitablabel=%N/\ %t\ %M
if g:toggleTabs == 1
	map <silent><F5> :tabnew<CR>
	map <silent><F6> :tabnext<CR>
	map <silent><S-F6> :tabprevious<CR>
else
	map <silent><C-tab> :bn<CR>
	map <silent><C-S-tab> :bp<CR>
endif

"map <silent><F12> :set wrap<cr>:set lbr<cr>
map <F11> :set hlsearch!<cr>

" Configurando o F12 para ativar/desativar o que eu chamo de 'notepad mode'
map <silent><F12> :call ChooseWrap()<CR>
function ChooseWrap()
	if &wrap
		call DisableDisplayWrapping()
	else
		call EnableDisplayWrapping()
	endif
endfunction
function EnableDisplayWrapping()
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
function DisableDisplayWrapping()
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

" Move o buffer atual para uma nova tab ------- desativei pq corresponde ao
" C-w S-T e move a janela atual para uma nova tab
"
" function MoveToTab()
"     let l:current = bufnr('%')
"     close
"     tabnew
"     exe "b ". l:current
" endfunction
" map to :call MoveToTab()<CR>

