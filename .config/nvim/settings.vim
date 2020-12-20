filetype plugin indent on       " File type detection
syntax enable                   " Enables syntax highlighting
set hidden                      " Required to keep multiple buffers open
set nowrap                      " Display long lines as just one line
set encoding=utf-8              " The encoding displayed
set pumheight=10                " Makes popup menu smaller
set fileencoding=utf-8          " The encoding written to file
set ruler                       " Show the cursor position all the time
set cmdheight=2                 " More space for displaying messages
set noshowmode                  " Hide mode like "-- INSERT --" due to lightline plugin
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
set timeoutlen=300              " By default timeoutlen is 1000 ms
set formatoptions-=cro          " Stop the newline continuation of comments
set clipboard=unnamedplus       " Copy-paste between vim and everything else:set number relativenumber
set shortmess+=c                " Don't pass messages to ins-completion-menu
set signcolumn=number           " Merge signcolumn and number column into one

" Enable theming support
if (has("termguicolors"))
  set termguicolors
endif

" Auto source when writing to init.vm to reflect changes, alternatively run :source $MYVIMRC
au! BufWritePost $MYVIMRC source %

" Allows Alt- keys (or Meta-) to work 
let c='a'
while c <= 'z'
  exec "map \e".c." <M-".c.">"
  exec "map! \e".c." <M-".c.">"
  let c = nr2char(1+char2nr(c))
endw
