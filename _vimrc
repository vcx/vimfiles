" New vimrc by Vinicius Canto

execute pathogen#infect()
syntax on
filetype plugin indent on
colors wombat

set guifont=Consolas:h13

set noswapfile


" Navigation mappings
"

"Space movement
nmap <space> <C-f>
nmap <S-space> <C-b>
nmap <C-space> 15zl
nmap <C-S-space> 15zh

"Essential commands
nmap ; :
imap jj <Esc>

"modeline para configurar opÃ§Ãµes especÃ­ficas para esse arquivo
" vim:fdm=marker foldminlines=0
