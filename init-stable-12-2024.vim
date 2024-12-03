set termguicolors
set number              " Show line numbers
syntax on               " Enable syntax highlighting
set tabstop=4           " Number of spaces for a tab
set shiftwidth=4        " Spaces for auto-indent
set expandtab           " Convert tabs to spaces
set relativenumber      " Show relative line numbers
set cursorline          " Highlight the current line
set clipboard=unnamedplus " Use system clipboard

set showmatch        " matching brackets
set ttyfast          " speed scrolling in Vim

set list
set listchars=tab:>-
set lcs=trail:-

set ignorecase     " ignore case when searching
set incsearch      " incremental search
set hlsearch       " highlight matching search patterns

set autoindent       " indent like previous line
set smartindent

set history=1000
set undolevels=1000

set splitright

set tabstop=2        " A tab counts as 2 spaces
set shiftwidth=2     " Indentation is 2 spaces
set expandtab        " Convert tabs to spaces
set softtabstop=2    " Insert 2 spaces when pressing Tab

set scrolloff=7      " keep the cursor at middle of screen

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

inoremap ds $
inoremap jk <ESC>
inoremap JK <ESC>

" ctrl + shift + s
inoremap  <ESC>:w<CR>

" alt + z
inoremap Ω <ESC>0i
" alt + x
inoremap ≈ <ESC>$a

inoremap <C-n> <C-x><C-o>


" Enable Lua support for plugin management
lua << EOF
require('packer').startup(function(use)
  -- Plugin manager
  use 'wbthomason/packer.nvim'

  use 'goolord/alpha-nvim'

  use 'windwp/nvim-autopairs'

  -- Colorschemes
  use 'gruvbox-community/gruvbox'       -- Gruvbox
  use 'dracula/vim'                     -- Dracula
  use 'folke/tokyonight.nvim'           -- Tokyo Night
  use 'rebelot/kanagawa.nvim'
  use 'Biscuit-Theme/nvim'              -- Biscuit theme https://github.com/Biscuit-Theme/nvim

  -- Git integration
  use 'lewis6991/gitsigns.nvim'

  -- LSP and Autocompletion
  use 'neovim/nvim-lspconfig'           -- Collection of configurations for built-in LSP
  use 'williamboman/mason.nvim'         -- LSP/DAP installer
  use 'williamboman/mason-lspconfig.nvim'
  use 'hrsh7th/nvim-cmp'                -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'            -- LSP completion source for nvim-cmp
  use 'hrsh7th/cmp-buffer'              -- Buffer completions
  use 'hrsh7th/cmp-path'                -- Path completions
  use 'L3MON4D3/LuaSnip'                -- Snippets plugin
  use 'saadparwaiz1/cmp_luasnip'        -- Snippets source for nvim-cmp

  use 'norcalli/nvim-colorizer.lua'     -- show actual color in editor for rgb or hexcode
  use 'vimwiki/vimwiki'

  -- Treesitter for syntax highlighting
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- File explorer
  use 'kyazdani42/nvim-tree.lua'

  -- Statusline
  use 'nvim-lualine/lualine.nvim'

  -- Fuzzy finder
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { 'nvim-lua/plenary.nvim' } }
end)
EOF

colorscheme biscuit

lua << EOF
require('gitsigns').setup()
EOF

lua << EOF
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "intelephense", "html" },
})
EOF

lua << EOF
local lspconfig = require('lspconfig')

-- PHP
lspconfig.intelephense.setup{}

-- HTML
lspconfig.html.setup{}

-- CSS
lspconfig.cssls.setup{}

-- JavaScript/TypeScript
lspconfig.ts_ls.setup{}
EOF

lua << EOF
require('lualine').setup {
  options = {
    icons_enabled = true,            -- Use icons in the statusline
    theme = 'powerline',               -- Change to match your colorscheme (e.g., 'tokyonight')
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = { 'NvimTree' }, -- Exclude specific file types
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
}
EOF

lua << EOF
require('gitsigns').setup {
  current_line_blame = true,           -- Enable blame for the current line
  current_line_blame_opts = {
    delay = 100,                       -- Delay before showing blame (in milliseconds)
    virt_text_pos = 'eol',             -- Position of blame text (eol = end of line)
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>'
}
EOF

lua << EOF
require('colorizer').setup({
  '*',                            -- Highlight all files, add file types like 'css', 'javascript' for specific file types
  css = { rgb_fn = true },        -- Enable parsing of rgb() functions in CSS
  html = { names = false },       -- Disable parsing "names" like Blue or Red in HTML files
})
EOF

lua << EOF
require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt", "vim" }, -- Optional: Disable in specific file types
})
EOF

lua << EOF
  local alpha = require('alpha')
  local dashboard = require('alpha.themes.dashboard')

  -- Set header (ASCII art or custom text)
  dashboard.section.header.val = {
"███████╗██╗  ██╗██╗███████╗████████╗██╗  ██╗██╗  ██╗",
"██╔════╝██║  ██║██║██╔════╝╚══██╔══╝██║  ██║██║  ██║",
"███████╗███████║██║█████╗     ██║   ███████║███████║",
"╚════██║██╔══██║██║██╔══╝     ██║   ╚════██║╚════██║",
"███████║██║  ██║██║██║        ██║        ██║     ██║",
"╚══════╝╚═╝  ╚═╝╚═╝╚═╝        ╚═╝        ╚═╝     ╚═╝"
  }

  -- Set buttons for common actions
  dashboard.section.buttons.val = {
    dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
    dashboard.button("n", "  New file", ":ene<CR>"),
    dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
    dashboard.button("p", "  Packer Plugin Manager", ":PackerSync<CR>"),
    dashboard.button("m", "  Mason", ":Mason<CR>"),
    dashboard.button("q", "  Quit", ":qa<CR>"),
  }

  -- Center the dashboard contents
  dashboard.config.layout = {
    { type = "padding", val = 10 }, -- Adds padding before the header
    dashboard.section.header,
    { type = "padding", val = 2 },
    dashboard.section.buttons,
    { type = "padding", val = 1 },
    dashboard.section.footer,
  }

  -- Apply the configuration
  alpha.setup(dashboard.config)
EOF

