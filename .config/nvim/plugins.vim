call plug#begin("~/.vim/plugged")

  " Themes
  Plug 'dracula/vim'
  Plug 'rakr/vim-one'

  " Git integration support
  Plug 'tpope/vim-fugitive'

  " Smartly toggles between relative and absolute line numbers
  Plug 'jeffkreeftmeijer/vim-numbertoggle'

  " Displays a popup with the available keybindings
  Plug 'liuchengxu/vim-which-key'

  " Nice-looking and configurable statusline/tabline
  Plug 'itchyny/lightline.vim'

  " Dependency for ranger, specific to neovim
  Plug 'rbgrouleff/bclose.vim'

  " File explorer, ranger integration
  Plug 'francoiscabrol/ranger.vim'

call plug#end()

" Plugin Settings 
"""""""""""""""""""""""""

" Disable ranger default shortcut as <leader>f
let g:ranger_map_keys = 0

" Configure lightline colorscheme and more
let g:lightline = { 'colorscheme': "one" }
let g:lightline.active = {
  \ 'left': [
  \   ['mode', 'paste'],
  \   ['gitbranch', 'readonly', 'filename', 'modified']
  \ ]}
let g:lightline.component_function = { 'gitbranch': 'FugitiveHead' }

" Set airline theme to 'one'
let g:airline_theme = 'one'
