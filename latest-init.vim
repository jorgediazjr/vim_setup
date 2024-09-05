let mapleader=" "               " leader is comma
let localleader=","

set number
filetype plugin indent on
set relativenumber
syntax on
set visualbell                  " flash when there is a mistake
set errorbells                  " Beep or flash screen on errors
set encoding=utf-8              " character encoding

set updatetime=100              " for gitgutter

set splitright

set showcmd                     " show command
set showmatch                   " matching brackets
set ttyfast                     " speed scrolling in Vim

set list
set lcs=trail:-

set scrolloff=11                " keep the cursor at middle of screen
set noautoindent
set autoindent                  " indent like previous line
set smartindent

set nowrap                      " if current line passes screen width, continue typing on same line
set noshiftround                " Round indent to multiple of 'shiftwidth'.
set mouse=a
set termguicolors

set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

set sidescroll=10

set lazyredraw

set tabline=%{strftime('%c')}
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

set laststatus=2
set backspace=indent,eol,start

set history=1000
set undolevels=1000

set ignorecase     " ignore case when searching
set incsearch      " incremental search
set hlsearch       " highlight matching search patterns

" Mappings
nnoremap ; :
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap mm M
nnoremap <Left><Left> 0
nnoremap <Right><Right> $
nnoremap <M-Left> 0
nnoremap <M-Right> $
nnoremap  <ESC>:w<CR>
" alt + h = ˙
nnoremap ˙ 0
" alt + l = ¬
nnoremap ¬ $

" key mapping in NORMAL mode to remove highlighted words from search results
nnoremap no :noh<return><esc>

" key mapping in NORMAL mode to delete current line
nnoremap - dd

" key mapping in NORMAL mode to open a vertical split blank file
nnoremap <leader>b <ESC>:vsp blank<CR>

" key mapping to move to previous window with left-key-arrow + tab
nnoremap <Left><tab> :tabprevious<CR>

" key mapping to move to next window
nnoremap <tab>       :tabnext<CR>
cnoreabbrev <expr> e ((getcmdtype() is# ':' && getcmdline() is# 'e')?('tabe'):('e'))
" Map 'e' followed by space to write ':tabe ' in the command line
nnoremap e<space> :tabe 

" Ensure 'e' behaves normally to move to the end of a word
nnoremap e e
" Map 'e' followed by space to get ready to open a new tab
"nnoremap e<space> :tabe<space>


inoremap jk <ESC>
inoremap JK <ESC>

" Vim-plug setup
call plug#begin('~/.local/share/nvim/plugged')

" Python support
Plug 'vim-python/python-syntax'
Plug 'psf/black', { 'branch': 'stable' }

" HTML, CSS, JS
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'

" Clojure support
Plug 'clojure-vim/clojure.vim'
Plug 'Olical/conjure'

" General LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'  " LSP manager
Plug 'williamboman/mason-lspconfig.nvim'

" Autocompletion and snippets
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'

" Code formatting
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

" Popular Neovim themes
Plug 'dracula/vim', { 'as': 'dracula' }       " Dracula theme
Plug 'gruvbox-community/gruvbox'              " Gruvbox theme
Plug 'morhetz/gruvbox'                        " Alternative Gruvbox
Plug 'folke/tokyonight.nvim'                  " Tokyo Night theme
Plug 'joshdick/onedark.vim'                   " OneDark theme
Plug 'sainnhe/everforest'                     " Everforest theme
Plug 'sainnhe/edge'                           " Edge theme
Plug 'sonph/onehalf', { 'rtp': 'vim' }        " OneHalf theme
Plug 'ayu-theme/ayu-vim'                      " Ayu theme
Plug 'Biscuit-Theme/nvim'                     " Biscuit theme https://github.com/Biscuit-Theme/nvim

Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ap/vim-css-color'
Plug 'radenling/vim-dispatch-neovim'
Plug 'tpope/vim-dispatch'
Plug 'clojure-vim/vim-jack-in'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
Plug 'windwp/nvim-autopairs'
Plug 'ggandor/lightspeed.nvim'
Plug 'lewis6991/gitsigns.nvim'
call plug#end()

highlight Comment cterm=italic gui=italic

let ayucolor="mirage" " for mirage version of theme
colorscheme ayu

" set airline theme
let g:airline_theme = 'zenburn'

" LSP Settings
lua << EOF
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "pyright", "tsserver", "clojure_lsp", "intelephense" }
})

local lspconfig = require("lspconfig")

-- PHP
lspconfig.intelephense.setup{}
-- Python
lspconfig.pyright.setup{}
-- JavaScript/TypeScript
lspconfig.ts_ls.setup{}
-- Clojure
lspconfig.clojure_lsp.setup{}

require('nvim-autopairs').setup{}
EOF

