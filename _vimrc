" vimrc by Vinicius Canto
" Versão 1.3.1
" Última Atualização: 2009-04-21

"TODO: criar função para facilitar edição de arquivos gigantes (desativar
"undo, swap e outros recursos para ganhar velocidade. ver no wikia)

if v:version >= 700

	"configuração dos arquivos de ajuda, lendo dentro da pasta pessoal
	if v:version >= 720
		:helpt ++t ~\vimfiles\doc
	endif

	"configura a linha em destaque, comum no Eclipse. (isso pode causar lentidão)
	set nocursorline

	"configurando o TAB no modo comando (see
	"http://vim.wikia.com/wiki/Great_wildmode/wildmenu_and_console_mouse)
	set wildmenu
	set wildmode=list:longest,full

	"WARNING: configuração de folding. Sugiro ler o help, já que essa é extremamente
	"pessoal.
	"
	"com a configuração a seguir, o folding segue a indentação, usa quatro colunas
	"à esquerda para mostrar o fold e só esconde trechos maiores que 10 linhas por
	"padrão. use zR para abrir todos e zM para fechar todos.
	set foldmethod=indent
	set foldcolumn=4
	set foldminlines=10

	"desativando o modo de compatibilidade com o vi
	set nocompatible

	"configurando os caracteres estranhos
	set listchars=trail:.,tab:._
	set list

	"frescura: configurando um espaço extra de limite quando for dar um scroll.
	"Configurando a taxa de repetição do teclado no máximo, evita H M L desnecessários.
	"bom, é difícil explicar isso... veja no help
	set scrolloff=5

	"configurando pra sempre aparecer a statusline
	set laststatus=2

	"liberando a seleção em bloco mesmo que não exista caractere na posição que eu
	"quero. Veja no help.
	set ve=all

	"Configurando tudo que deve aparecer na minha statusline
	set statusline=%<%f\ %6.h%m%r[%{&fileencoding}]%=A:%03.b\ H:0x%02.B\ Lin:%l\ Ch:%c\ Col:%v\ %P

	"Configurando o split padrão para vertical
	set splitright

	"Configurando a codificação dos arquivos
	set encoding=utf-8
	set termencoding=latin1 "algumas vezes pode colocar utf-8, dependendo do SO.

	"Configurando a altura da barra de comandos
	set cmdheight=3

	"Configurando a linha de tabs
	set stal=2

	"{{{ carregando esquema de cores e configuração de tela

	if has("gui_running") "pode ser usado também o gvimrc ao invés do has(guirunning)
		"melhor para programar
		colorscheme desert

		"melhor para apresentações em projetores
		"colorscheme murphy

		"Configurando a área da tela
		set lines=35
		set columns=130

		"configurando o que vai aparecer na interface gráfica. Veja no help.
		"Tirei a barra de ferramentas, 
		set go=eirbh "m é a barra de menus, em caso de emergencia.

		"certificando que o ALT não vai ser usado pra nada
		set winaltkeys=no

		"frescura: aumentando o espaço entre as linhas na interface gráfica.
		"Aumenta legibilidade
		set linespace=2

		"configuração da fonte no modo gráfico para usar a Consolas. Ative o
		"ClearType (mesmo em CRTs) ou o resultado não será bom...
		if has("win32")
			set gfn=Lucida_Console:h10:cANSI "caso a consolas não exista, vai de lucida mesmo
			set gfn=Consolas:h10:cANSI
			"set gfn=Lucida_Sans_Typewriter:h12:cANSI
		else
			set gfn="Bitstream_Vera_Sans_Mono":h10:cANSI "fonte boa para usar no Linux/Enlightenment
		endif
	else
		colorscheme slate
		set bg=dark
	endif

	"}}}

	"desliga quebras de linha automáticas
	set nowrap

	"mostra a régua, mostrando o posicionamento na tela no canto esquerdo
	set ruler

	"indentacao automagica
	set autoindent

	"ft on. Verifique com :ft
	filetype plugin on
	filetype plugin indent on

	"nivel de indentacao
	set shiftwidth=5                "tamanho do >> << e cident
	set tabstop=5                   "tamanho do tab msm
	"deixe esses dois números iguais pra travar o TAB pra tudo. Use os arquivos
	"~/vimfiles/ftplugin/<linguagem>.vim para configurações diferentes para cada
	"linguagem

	"configura o backspace corretamente
	set backspace=indent,eol,start whichwrap+=<,>,[,]

	"numeracao do lado esquerdo
	set number

	"syntax highlighting
	syntax on

	"opções que tornam a busca mais interessante...
	set hlsearch "veja o mapemento do F11 mais abaixo
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

	"{{{"mapeamento do teclado numérico

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

	"}}}

	"{{{ mapeamentos do modo inserção

	imap <C-backspace> <C-w>
	imap <C-delete> <C-o>dw
	imap <S-Enter> <C-o>O<Esc>ji
	imap <C-Enter> <C-o>o<Esc>ki

	imap <F3> <C-o><F3>
	imap <F5> <ESC>:tabnew<CR>
	imap <F6> <C-o><C-w><C-w>

	imap <C-j> <down>
	imap <C-k> <up>
	imap <C-l> <right>
	imap <C-h> <left>

	imap jj <ESC>

	"}}}

	"{{{ mapeamentos do modo normal
	nmap <space> <C-d>
	nmap <S-space> <C-u>
	nmap <S-Enter> O<Esc>j
	nmap <C-Enter> o<Esc>k

	nmap ; :

	"}}}

	"mapeamento de teclas de função

	"F1 -- Help. Interno do VIM
	"F2 -- Abrir arquivo usando FuzzyFinder
	"F3 -- Salvar arquivo usando janelas
	"F4 -- Fechar usando :q
	"F5 -- Nova tab.
	"F6 -- Próxima Tab
	"Shift + F6 -- Tab Anterior
	"F12 -- Alterna entre modo normal e modo "notepad", ativando o wrap e o
	"linebreak

	nmap <F1> :help<space>
	nmap <F2> :FuzzyFinderFile<CR>
	nmap <C-F2> :FuzzyFinderMruFile<CR>

	nmap <F3> :if expand("%") == ""<Bar>browse confirm w<Bar>else<Bar>confirm w<Bar>endif<CR>
	nmap <F4> :q<CR>

	nmap <F6> <C-w><C-w>

	let g:toggleTabs = 1
	set guitablabel=%N/\ %t\ %M
	if g:toggleTabs == 1
		map <silent><F5> :tabnew<CR>
		nmap <C-Tab> :tabnext<CR>
		nmap <S-Tab> :tabprevious<CR>
	else
		map <silent><C-tab> :bn<CR>
		map <silent><C-S-tab> :bp<CR>
	endif

	nmap <F7> :NERDTreeToggle<CR>
	nmap <F8> :TlistToggle<CR>

	map <F11> :set hlsearch!<cr>

	"{{{ Configurando o F12 para ativar/desativar o que eu chamo de 'notepad mode'
	map <silent><F12> :call ChooseWrap()<CR>
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
	"}}}

	"opções do TagList

	"não aumentar a janela do Vim quando acionar o taglist
	let Tlist_Inc_Winwidth = 0


	"opções do nerdcommenter
	let NERDShutUp=1


	"{{{ comandos definidos pelo usuário

	command Cdhere :cd %:h

	"}}}

endif


"modeline para configurar opções específicas para esse arquivo
" vim:fdm=marker foldminlines=0
