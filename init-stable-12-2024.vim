let mapleader=" "               " leader is comma
let localleader=","

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

" key mapping to move to previous window with left-key-arrow + tab
nnoremap <Left><tab> :tabprevious<CR>

" key mapping to move to next window
nnoremap <tab>       :tabnext<CR>
cnoreabbrev <expr> e ((getcmdtype() is# ':' && getcmdline() is# 'e')?('tabe'):('e'))
" Map 'e' followed by space to write ':tabe ' in the command line
nnoremap e<space> :tabe 

" Ensure 'e' behaves normally to move to the end of a word
nnoremap e e

" key mapping in NORMAL mode to open a vertical split blank file
nnoremap <leader>b <ESC>:vsp blank<CR>

" Key mapping to open LazyGit
nnoremap <leader>lg :LazyGit<CR>

" Key mapping for Telescope colorscheme picker
nnoremap <leader>cs :Telescope colorscheme<CR>

" Map <leader>e to toggle NvimTree
nnoremap <leader>e :NvimTreeToggle<CR>

nnoremap <leader>so :SymbolsOutline<CR>

nnoremap <leader>fs :Telescope lsp_document_symbols<CR>

" Key mapping for viewing code actions
nnoremap <silent> <leader>ca :lua vim.lsp.buf.code_action()<CR>

" Key mapping for navigating diagnostics
nnoremap <silent> <leader>dn :lua vim.diagnostic.goto_next()<CR>
nnoremap <silent> <leader>dp :lua vim.diagnostic.goto_prev()<CR>

" Key mapping for showing diagnostic details in a floating window
nnoremap <silent> <leader>ds :lua vim.diagnostic.open_float()<CR>

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

  use 'kyazdani42/nvim-web-devicons'

  use 'echasnovski/mini.nvim'

  use 'tpope/vim-fugitive'

  use 'junegunn/fzf.vim'

  use 'justinmk/vim-sneak'

  use 'preservim/nerdtree'

  use 'sheerun/vim-polyglot'

  use 'mattn/emmet-vim'

  use 'simrat39/symbols-outline.nvim'

  use 'marcussimonsen/let-it-snow.nvim'

  -- Colorschemes
  use 'gruvbox-community/gruvbox'       -- Gruvbox
  use 'dracula/vim'                     -- Dracula
  use 'folke/tokyonight.nvim'           -- Tokyo Night
  use 'rebelot/kanagawa.nvim'
  use 'rose-pine/neovim'
  use 'atmosuwiryo/vim-winteriscoming'
  use 'arcticicestudio/nord-vim'        -- Cool and frosty
  use 'Biscuit-Theme/nvim'              -- Biscuit theme https://github.com/Biscuit-Theme/nvim
  use 'sainnhe/sonokai'                 -- Sonokai colorscheme
  use 'savq/melange-nvim'
  use({
    "neanias/everforest-nvim",
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require("everforest").setup()
    end,
  })

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
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- File explorer
  use 'kyazdani42/nvim-tree.lua'

  -- Statusline
  use 'nvim-lualine/lualine.nvim'

  -- Telescope and its dependencies
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- LazyGit plugin
  use {
    'kdheepak/lazygit.nvim',
    requires = { 'nvim-lua/plenary.nvim' }, -- Required dependency
  }

  use {
    'prettier/vim-prettier',
    run = 'npm install'
  }

  use {
    "folke/todo-comments.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup {}
    end
  }
end)
EOF

let g:user_emmet_leader_key = '<C-e>'  " Set a custom key for Emmet triggers

lua << EOF
require('gitsigns').setup()
EOF

lua << EOF
require('symbols-outline').setup()
EOF

lua << EOF
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "intelephense", "html" },
})
EOF

lua << EOF
require'nvim-treesitter.configs'.setup {
  -- Languages to be installed
  ensure_installed = { "php", "html", "css", "javascript" },

  -- Automatically install missing parsers when entering a buffer
  auto_install = true,

  -- Highlighting configuration
  highlight = {
    enable = true, -- Enable Treesitter-based highlighting
    additional_vim_regex_highlighting = false, -- Disable built-in regex highlighting for better performance
  },

  -- Enable indentation based on Treesitter
  indent = {
    enable = true,
  },

  playground = {
    enable = true,
  },
}
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
    theme = 'auto', -- Match the colorscheme
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = { 'NvimTree' }, -- Exclude specific file types
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { { 'filename', icon = '🎄' } }, -- Add a Christmas tree icon
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
require('nvim-tree').setup({
    sort_by = "case_sensitive",  -- Sort files case sensitively
    view = {
        adaptive_size = true,   -- Resize tree based on content
        side = "left",          -- Tree appears on the left side
        width = 30,             -- Tree width (in columns)
    },
    renderer = {
        highlight_opened_files = "name", -- Highlight opened files
        highlight_git = true,            -- Highlight Git changes
        icons = {
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    arrow_open = "",
                    arrow_closed = "",
                    default = "",
                    open = "",
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                },
            },
        },
    },
    actions = {
        open_file = {
            quit_on_open = true, -- Close tree when opening a file
        },
    },
    diagnostics = {
        enable = true,          -- Show diagnostics (e.g., errors)
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    git = {
        enable = true,          -- Show git status
        ignore = false,         -- Show ignored files
    },
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
    dashboard.button("k", "  Check keymaps", ":Telescope keymaps<CR>"),
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

" Enable a cozy colorscheme
colorscheme quiet

" Set Sonokai colorscheme
let g:sonokai_style = 'espresso'     " Options: default, andromeda, shusia, maia, atlantis, espresso
let g:sonokai_enable_italic = 1       " Enable italic text
let g:sonokai_disable_italic_comment = 0 " Enable italic for comments
let g:sonokai_cursor = 'auto'         " Cursor highlighting mode
let g:sonokai_better_performance = 1  " Improve performance
colorscheme sonokai



"highlight Normal guibg=#002b36 guifg=#839496
"highlight String guifg=#98be65

"highlight Normal guibg=#002b36 guifg=#eee8d5
"highlight Comment guifg=#586e75 gui=italic
"highlight Keyword guifg=#FF0000 gui=bold  " Red for keywords
"highlight String guifg=#00FF00 gui=bold  " Green for strings
"highlight Function guifg=#FFD700 gui=bold  " Gold for functions
"highlight CursorLine guibg=#1c1f24
"highlight LineNr guifg=#839496 guibg=#002b36
"highlight Search guibg=#FF4500 guifg=#000000 gui=bold
"highlight Visual guibg=#073642

" Festive highlights
"highlight Normal guibg=#1c1f24 guifg=#f0f0f0
"highlight Comment guifg=#778899 gui=italic
"highlight Keyword guifg=#FF6347 gui=bold " Tomato red
"highlight String guifg=#32CD32 gui=bold " Lime green
"highlight Function guifg=#FFD700 gui=bold " Gold
"highlight CursorLine guibg=#002b36
"highlight Identifier guifg=#FFD700

