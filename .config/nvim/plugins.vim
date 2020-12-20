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

  " Dependency for ranger, specific to neovim. Easily close buffer w/o closing
  " window
  Plug 'rbgrouleff/bclose.vim'

  " File explorer, ranger integration
  Plug 'francoiscabrol/ranger.vim'
  
  " Full path fuzzy file, buffer, mru, tag, ...finder for Vim
  Plug 'ctrlpvim/ctrlp.vim'

  " Plugin for easily commenting out lines
  Plug 'tpope/vim-commentary'

  " Code completion plugin
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Language-specific plugins
  Plug 'elixir-editors/vim-elixir'

  " Vim start page
  Plug 'mhinz/vim-startify'

  " Plugin for ripgrep
  Plug 'mileszs/ack.vim'

  " Plugin for easily moving lines of code up and down
  Plug 'matze/vim-move'

call plug#end()

" Plugin Settings 
"""""""""""""""""""""""""

" Disable ranger default shortcut as <leader>f
let g:ranger_map_keys = 0

" Use ranger instead of netrw when opening a dir
let g:ranger_replace_netrw = 1

" set onedark background color to match terminal theme
let g:onedark_color_overrides = {
  \ 'black': { 'gui': "#272835", 'cterm': "235", 'cterm16': "0" }
  \}

" Function for coc integration with lightline
function! CocCurrentFunction()
  return get(b:, 'coc_current_function', '')
endfunction

" Configure lightline colorscheme and more
let g:lightline = { 'colorscheme': "onedark" }
let g:lightline.active = {
  \ 'left': [
  \   ['mode', 'paste'],
  \   ['cocstatus', 'currentfunction', 'gitbranch', 'readonly', 'filename', 'modified']
  \ ]
  \}
let g:lightline.component_function = {
  \ 'gitbranch': 'FugitiveHead',
  \ 'cocstatus': 'coc#status',
  \ 'currentfunction': 'CocCurrentFunction'
  \}

" ack.vim --- {{{

" Use ripgrep for searching ⚡️
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'

" Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose = 1

" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1

" Don't jump to first match
cnoreabbrev Ack Ack!
" }}}
