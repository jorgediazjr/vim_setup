let mapleader=","               " leader is comma

set nocompatible                " do not turn off VIM enhancements
filetype plugin indent on       " You can enable loading the plugin files for specific file types with
syntax on                       " Vim to overrule your settings with the defaults
set visualbell                  " flash when there is a mistake
set errorbells                  " Beep or flash screen on errors
set encoding=utf-8              " character encoding

set updatetime=100              " for gitgutter

set splitbelow                  " how do you want your windows split
set splitright

set showcmd                     " show command
set showmatch                   " matching brackets
set ttyfast                     " speed scrolling in Vim

set list
set lcs=trail:-

set scrolloff=11                " keep the cursor at middle of screen

set iskeyword=@,48-57,192-255   " what is considered words in Vim

set foldmethod=indent           " how do you want the method for fold
set nofoldenable                " files are normal when opened, not folded

set nowrap                      " if current line passes screen width, continue typing on same line

set noshiftround                " Round indent to multiple of 'shiftwidth'.
set autoindent                  " indent like previous line
set smartindent

set expandtab                   " don't use actual tab character
set shiftwidth=4                " indenting is 4 spaces
set softtabstop=4

set sidescroll=10

set lazyredraw

set tabline=%{strftime('%c')}
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

set laststatus=2
set number         " line numbers
set mouse=a        " enable mouse usage
set backspace=indent,eol,start

set history=1000
set undolevels=1000

set ignorecase     " ignore case when searching
set incsearch      " incremental search
set hlsearch       " highlight matching search patterns

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

nnoremap <leader>cs :Telescope colorscheme<CR>
nnoremap <leader>mp :Telescope man_pages<CR>

cnoreabbrev <expr> e ((getcmdtype() is# ':' && getcmdline() is# 'e')?('tabe'):('e'))

inoremap ds $
inoremap jk <ESC>
inoremap JK <ESC>

" ctrl + shift + s
inoremap  <ESC>:w<CR>

" alt + z
inoremap Ω <ESC>0i
" alt + x
inoremap ≈ <ESC>$a

set number relativenumber           " show current line number with relative numbers above and below

set cursorline

" we want comments to be italicized
highlight Comment cterm=italic gui=italic


let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'ayu-theme/ayu-vim' " or other package manager
Plug 'Yggdroot/indentLine'
Plug 'sickill/vim-monokai'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ap/vim-css-color'
Plug 'sainnhe/vim-color-forest-night'
Plug 'rhysd/vim-syntax-christmas-tree'
Plug 'capaldo/boogiewoogie'
Plug 'tpope/vim-repeat'
Plug 'catppuccin/nvim'
Plug 'folke/tokyonight.nvim'
Plug 'jacoborus/tender.vim'
Plug 'EdenEast/nightfox.nvim'
Plug 'liuchengxu/space-vim-theme'
Plug 'elmcast/elm-vim'

" Neovim-specific plugins
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
Plug 'windwp/nvim-autopairs'
Plug 'ggandor/lightspeed.nvim'
Plug 'capaldo/boogiewoogie'
Plug 'lewis6991/gitsigns.nvim'

Plug 'savq/melange'
Plug 'haystackandroid/strawberry'
Plug 'adigitoleo/vim-mellow', { 'tag': '*' }
call plug#end()

" Source lua configs
let g:conf_root = expand('<sfile>:p:h')
let g:nvim_lua_config_root = g:conf_root . '/lua'
let g:config_luafile_list = ['telescope-conf', 'lspconf', 'autopairs', 'gitsigns']
for f in g:config_luafile_list
    execute 'luafile ' . g:nvim_lua_config_root . '/' . f . '.lua'
endfor


" vim airline settings

" vim airline theme settings
"let g:airline_theme='google_light'

" git gutter settings
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}

" settings for ayu colorscheme
set termguicolors     " enable true colors support
let ayucolor="dark"   " for dark version of theme
let ayucolor="mirage" " for mirage version of theme
let ayucolor="light"  " for light version of theme

" Set contrast.
" This configuration option should be placed before `colorscheme everforest`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:everforest_background = 'soft'

colorscheme boogiewoogie
colorscheme ayu
colorscheme monokai
colorscheme everforest
set background=dark

" Example config in VimScript
let g:tokyonight_style = "night"
let g:tokyonight_italic_functions = 1
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]

" Change the "hint" color to the "orange" color, and make the "error" color bright red
let g:tokyonight_colors = {
  \ 'hint': 'orange',
  \ 'error': '#ff0000'
\ }

" set airline theme
let g:airline_theme = 'zenburn'

" Theme
syntax enable

set background=dark


" Load the colorscheme
colorscheme ayu

colorscheme space_vim_theme

colorscheme tokyonight

colorscheme tender

set noshowmode

colorscheme strawberry-light

set background=dark
colorscheme duskfox

set background=light
colorscheme mellow
colorscheme melange


let g:everforest_background = 'soft'
colorscheme everforest


" settings for indentline plugin
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" Show syntax highlighting groups for word under cursor
nmap <C-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
