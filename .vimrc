set nocompatible                                " do not turn off VIM enhancements
filetype plugin on                              " You can enable loading the plugin files for specific file types with
syntax on                                       " Vim to overrule your settings with the defaults
set visualbell                                  " flash when there is a mistake
set errorbells	                                " Beep or flash screen on errors
set encoding=utf-8                              " character encoding

set splitbelow                                  " how do you want your windows split

set showcmd                                     " show command
set showmatch                                   " matching brackets
set ttyfast                                     " speed scrolling in Vim

set scrolloff=11                                " keep the cursor at middle of screen

set iskeyword=@,48-57,192-255                   " what is considered words in Vim

set foldmethod=indent           " how do you want the method for fold
set nofoldenable                " files are normal when opened, not folded

set nowrap                      " if current line passes screen width, continue typing on same line

set noshiftround                " Round indent to multiple of 'shiftwidth'.
set autoindent                  " indent like previous line
set smartindent

set expandtab                   " don't use actual tab character
set shiftwidth=2                " indenting is 2 spaces
set softtabstop=2

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

" key mapping in NORMAL mode to remove highlighted words from search results
nnoremap no :noh<return><esc>

" key mapping in NORMAL mode to delete current line
nnoremap - dd
nnoremap <leader>b <ESC>:vsp blank<CR>
nnoremap <Left><tab> :tabprevious<CR>
nnoremap <tab>       :tabnext<CR>
cnoreabbrev <expr> e ((getcmdtype() is# ':' && getcmdline() is# 'e')?('tabe'):('e'))

inoremap ds $
inoremap ht #
inoremap jk <ESC>
inoremap JK <ESC>
inoremap  <ESC>:w<CR>
inoremap å <ESC>0i

set number relativenumber           " show current line number with relative numbers above and below

set cursorline

" we want comments to be italicized
highlight Comment cterm=italic gui=italic

colo monokai

" Show syntax highlighting groups for word under cursor
nmap <C-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
