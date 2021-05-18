" Settings
"""""""""""""""""""""""""

filetype plugin indent on       " File type detection
syntax enable                   " Enables syntax highlighting
set hidden                      " Required to keep multiple buffers open
set nowrap                      " Display long lines as just one line
set encoding=utf-8              " The encoding displayed
set pumheight=10                " Makes popup menu smaller
set fileencoding=utf-8          " The encoding written to file
set ruler                       " Show the cursor position all the time
set cmdheight=1                 " More space for displaying messages
set noshowmode                  " Hide mode like "-- INSERT --" due to lualine plugin
set iskeyword+=-                " Treat dash separated words as a word text object
set mouse=a                     " Enable your mouse
set splitbelow                  " Horizontal splits will automatically be below
set splitright                  " Vertical splits will automatically be to the right
set t_Co=256                    " Support 256 colors
set conceallevel=0              " So that `` can be seen in markdown files
set tabstop=2                   " Insert 2 spaces for a tab
set shiftwidth=2                " Change the number of space characters inserted for indentation
set smarttab                    " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                   " Converts tabs to spaces
set smartindent                 " Makes indenting smart
set autoindent                  " Good auto indent
set laststatus=2                " Always display the status line
set number                      " Line numbers
set relativenumber              " Relative line numbers
set nu rnu                      " Turn on hybric line numbers
set cursorline                  " Enable highlighting of the current line
set nobackup                    " Recommended setting by coc
set nowritebackup               " Recommended setting by coc
set updatetime=300              " Faster completion
set timeoutlen=500              " By default timeoutlen is 1000 ms
set clipboard=unnamedplus       " Copy-paste between vim and everything else
set shortmess+=c                " Don't pass messages to ins-completion-menu
set signcolumn=number           " Merge signcolumn and number column into one
set ignorecase                  " Ignore case when searching a file
set smartcase                   " Searches are only case sensitive when typing a capital letter
set completeopt=menuone,noselect " Set completeopt to have a better completion experience
set termguicolors

" Stop the newline continuation of comments
au BufEnter * set fo-=c fo-=r fo-=o

" Plugins
"""""""""""""""""""""""""

call plug#begin("~/.vim/plugged")

  " Themes
  Plug 'marko-cerovac/material.nvim'
  Plug 'joshdick/onedark.vim'
  Plug 'folke/tokyonight.nvim'
  Plug 'ajmwagar/vim-deus'
  Plug 'rafamadriz/neon'

  " Git integration support
  Plug 'tpope/vim-fugitive'

  " Smartly toggles between relative and absolute line numbers
  Plug 'jeffkreeftmeijer/vim-numbertoggle'

  " Displays a popup with the available keybindings
  Plug 'folke/which-key.nvim'

  " Nice-looking and configurable statusline/tabline
  Plug 'hoob3rt/lualine.nvim'
  " Plug 'glepnir/galaxyline.nvim'

  " Icons for filetypes that work well with lualine
  Plug 'kyazdani42/nvim-web-devicons'

  " Plugin for easily commenting out lines
  Plug 'tpope/vim-commentary'

  " Language server protocol plugins
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'
  Plug 'folke/lsp-trouble.nvim'

  " Language-specific plugins
  Plug 'elixir-editors/vim-elixir'
  Plug 'gleam-lang/gleam.vim'

  " Improves syntax highlighting, missing elixir support though
  " Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " Telescope + deps
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  " File explorer
  Plug 'kyazdani42/nvim-tree.lua'

  " Vim start page
  Plug 'mhinz/vim-startify'

  " Plugin for easily moving lines of code up and down
  Plug 'matze/vim-move'

call plug#end()

" Plugin Settings 
"""""""""""""""""""""""""

let g:mapleader = "\<Space>"
let g:maplocalleader = ","

" Set the modifier key for vim-move to Ctrl
let g:move_key_modifier = 'C'

lua << EOF
  -- local galaxyline = require('galaxyline')
  local lspconfig = require('lspconfig')
  local lualine = require('lualine')
  local telescope = require('telescope')
  local trouble = require('trouble')
  local wk = require('which-key')

  lualine.setup {
    options = {
      theme = 'onedark',
      -- section_separators = '',
      -- component_separators = '',
    }
  }
   
  lspconfig.elixirls.setup {
    cmd = { "elixir-ls" },
    on_attach = require("completion").on_attach,
  }

  -- TODO integrate trouble provider into telescope?
  telescope.setup {}
  trouble.setup {}
  
  wk.setup {}
  wk.register({
    ["<leader>b"] = {
      name = "+buffers",
      d = { "Close current buffer" },
    },
    ["<leader>r"] = { "Refresh file explorer" },
    ["<leader>f"] = {
      name = "+find",
      f = { "Find files" },
      g = { "Live grep" },
      b = { "Open buffers" },
      h = { "Help tags" },
    },
    ["<leader>g"] = {
        name = "+goto",
        d = { "Go to definition" },
        D = { "Go to declaration" },
        i = { "Go to implementation" },
        r = { "Go to references" },
    },
    ["<leader>w"] = {
        name = "+windows",
        s = { "Split window below" },
        v = { "Split window right" },
        r = { "Swap windows" },
        j = { "Go to window below current" },
        k = { "Go to window above current" },
        h = { "Go to window to the left" },
        l = { "Go to window to the right" },
    },
    ["<leader>x"] = {
      name = "+diagnostics",
      x = { "Toggle the diagnostics list" },
      w = { "Workspace diagnostics" },
      d = { "Document diagnostics" },
      q = { "Quickfix list" },
      l = { "Location list" },
    },
  })
EOF

" Key Mappings
""""""""""""""""""""""""

" Toggle file explorer
nnoremap <C-b> :NvimTreeToggle<CR> 
nnoremap <leader>r :NvimTreeRefresh<CR>

nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>

nnoremap <silent> <leader>gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <leader>gi <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> [g <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> ]g <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" hint, press K to focus into the documentation popup, scrolling w/
" mouse works too
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>

nnoremap <leader>xx <cmd>LspTroubleToggle<CR>
nnoremap <leader>xw <cmd>LspTroubleToggle lsp_workspace_diagnostics<CR>
nnoremap <leader>xd <cmd>LspTroubleToggle lsp_document_diagnostics<CR>
nnoremap <leader>xq <cmd>LspTroubleToggle quickfix<CR>
nnoremap <leader>xl <cmd>LspTroubleToggle loclist<CR>
nnoremap <silent> gr <cmd>LspTroubleToggle lsp_references<CR>

command! -nargs=0 Format :lua vim.lsp.buf.formatting()

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Manually trigger completion
imap <silent> <C-Space> <Plug>(completion_trigger)

" Window-specific shortcuts
nnoremap <Leader>ws <C-W>s
nnoremap <Leader>wv <C-W>v
nnoremap <Leader>wr <C-W>R
nnoremap <Leader>wj <C-W>j
nnoremap <Leader>wk <C-W>k
nnoremap <Leader>wh <C-W>h
nnoremap <Leader>wl <C-W>l

" <Ctrl-n> redraws the screen and removes any search highlighting
nnoremap <silent> <C-n> :nohlsearch<CR>

" Navigate quickfix list easily
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>

" Close current buffer
nnoremap <Leader>bd <cmd>bdelete<CR>

" Theming
"""""""""""""""""""""""""

" One Dark theme overrides
let g:onedark_color_overrides = {
\ "black": {"gui": "#272835", "cterm": "235", "cterm16": "0" }
\}

colorscheme onedark

