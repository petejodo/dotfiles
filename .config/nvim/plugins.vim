call plug#begin("~/.vim/plugged")

  " Themes
  Plug 'arcticicestudio/nord-vim'   " a little too blue and bland for my taste
  Plug 'dracula/vim'                " doesn't match my terminal theme too well
  Plug 'joshdick/onedark.vim'
  Plug 'rakr/vim-one'               " has some color issues with ranger.vim

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
  
  " Full path fuzzy file, buffer, mru, tag, ...finder for Vim
  Plug 'ctrlpvim/ctrlp.vim'

  " Language-specific plugins
  Plug 'elixir-editors/vim-elixir'

call plug#end()

" Plugin Settings 
"""""""""""""""""""""""""

" Disable ranger default shortcut as <leader>f
let g:ranger_map_keys = 0

" set onedark background color to match terminal theme
let g:onedark_color_overrides = {
  \ 'black': { 'gui': "#272835", 'cterm': "235", 'cterm16': "0" }
  \}

" Configure lightline colorscheme and more
let g:lightline = { 'colorscheme': "onedark" }
let g:lightline.active = {
  \ 'left': [
  \   ['mode', 'paste'],
  \   ['gitbranch', 'readonly', 'filename', 'modified']
  \ ]
  \}
let g:lightline.component_function = { 'gitbranch': 'FugitiveHead' }

