" This file follows the tutorial at https://jdhao.github.io/2018/12/24/centos_nvim_install_use_guide_en/
" [TODO] https://www.reddit.com/r/neovim/comments/mu976j/new_dark_neovim_theme_tokyonight_written_in_lua/

" Set python interpereter to use virtualenvs
" The env variable is something like /foo/bar/bin/python
if !empty($CONDANVIM)
  let g:python3_host_prog= $CONDANVIM
endif

call plug#begin('~/.local/share/nvim/plugged')

Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'davidhalter/jedi-vim'
Plug 'machakann/vim-highlightedyank'
Plug 'morhetz/gruvbox'
Plug 'sickill/vim-monokai'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'Yggdroot/indentLine'

call plug#end()

let g:deoplete#enable_at_startup = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"let g:airline_theme='powerlineish'
let g:airline_theme='jellybeans'
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" Show buffer number for easier switching between buffer,
" see https://github.com/vim-airline/vim-airline/issues/1149
let g:airline#extensions#tabline#buffer_nr_show = 1
" Buffer number display format
let g:airline#extensions#tabline#buffer_nr_format = '%s. '
let g:airline_powerline_fonts = 1

" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0
" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

"let g:gruvbox_contrast_dark = "hard"
"colorscheme gruvbox
"set background=dark
colorscheme monokai

" The VCS to use
let g:signify_vcs_list = [ 'git' ]
" Change the sign for certain operations
let g:signify_sign_change = '~'
nnoremap <silent> <leader>gc :Git commit<CR>
nnoremap <silent> <leader>gs :Git<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>gpl :Git pull<CR>
" Note that to use bar literally, we need backslash it, see also `:h :bar`.
nnoremap <silent> <leader>gpu :15split \| term git push

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 0

"let g:indent_blankline_space_char = ' '
let b:indent_blankline_enabled = v:false
let g:indentLine_char = '▏'

set noswapfile

set number  " Show line number and relative line number

" Character to show before the lines that have been soft-wrapped
set showbreak=↪

" General tab settings
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " expand tab to spaces so that tabs are spaces

" Use mouse to select and resize windows, etc.
set mouse=nic  " Enable mouse in several mode
set mousemodel=popup  " Set the behaviour of mouse

" Do not show mode on command line since vim-airline can show it
set noshowmode

" Ask for confirmation when handling unsaved or read-only files
set confirm

set visualbell noerrorbells  " Do not use visual and errorbells
set history=500  " The number of command and search history to keep

set nofoldenable

" Case insensitive autocompletion for command mode
set wildignorecase

" Switch between buffers without saving
set hidden

" Some keybindings
" <leader>cc comment out single line
" <leader>cu uncomment a line
" <leader>d: go to definition
" K: check documentation of class or method
" <leader>n: show the usage of a name in current file
" <leader>r: rename a name
" C-ww: Change the window
