if &compatible
	set nocompatible
endif

set runtimepath+=/home/devmin/.cache/dein/repos/github.com/Shougo/dein.vim
"" Notes:
" For neovim-fuzzy to work we need to isntall following packages with apt-get
" - apt-get install silversearcher-ag
" - apt-get install fzy
" Then it should work
"
" For typescript support install following packages:
" - npm install -g neovim
" - npm install -g typescript

if dein#load_state('/home/devmin/.cache/dein')
  call dein#begin('/home/devmin/.cache/dein')
  call dein#add('/home/devmin/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('HerringtonDarkholme/yats.vim')
  call dein#add('mhartington/nvim-typescript', {'build': './install.sh'})
  call dein#add('freeo/vim-kalisi')
  call dein#add('cloudhead/neovim-fuzzy')	
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('prettier/vim-prettier')
  call dein#add('townk/vim-autoclose')

  call dein#end()
  call dein#save_state()
endif

" Start the autocompletion plugin
let g:deoplete#enable_at_startup = 1

filetype plugin indent on
syntax enable

" automatically install not installed plugins
if dein#check_install()
	call dein#install()
endif

" Settings for color scheme
set background=dark
colorscheme kalisi
let g:airline_theme = "kalisi"
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
set termguicolors

"general editor configs
set tabstop=2
set softtabstop=0 noexpandtab
set shiftwidth=2
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
set relativenumber  

"Keymappings

let mapleader=','

" Add a shortcut for fuzzy search
nnoremap <C-p> :FuzzyOpen<CR>

" vertical resizing mappings
map <leader>+ :vertical resize +4<CR>
map <leader># :vertical resize -4<CR>
map <leader>ö :vertical resize 40<CR>

map <leader>so :source $MYVIMRC<CR>
map <leader>e :e#<CR>

" Typescript mappings
map <leader>ti :TSImport<CR>
map <leader>td :TSDef<CR>
map <leader>tf :TSGetCodeFix
map <leader>tdp :TSDefPreview<CR>

" Directory Tree Configs
let g:netrw_banner = 0
let g:netrw_browse_split = 2 
let g:netrw_winsize = 25
let g:netrw_liststyle = 3

" Pretter config

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
