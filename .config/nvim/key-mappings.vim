let g:mapleader = "\<Space>"
let g:maplocalleader = ","

" List open buffers and prepare input to select buffer 
nnoremap <C-b> :ls<CR>:b<Space>

" File-specific shortcuts
nnoremap <silent> <Leader>f :Ranger<CR>

" Go-to shortcuts
nnoremap <Leader>gb :ls<CR>:b<Space>
nnoremap <Leader>gd gd
nnoremap <Leader>gy gy
nnoremap <Leader>gi gi
nnoremap <Leader>gr gr

" Window-specific shortcuts
nnoremap <Leader>ws <C-W>s
nnoremap <Leader>wv <C-W>v
nnoremap <Leader>wr <C-W>R
nnoremap <Leader>wj <C-W>j
nnoremap <Leader>wk <C-W>k
nnoremap <Leader>wh <C-W>h
nnoremap <Leader>wl <C-W>l

" <Ctrl-l> redraws the screen and removes any search highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Easily search the codebase
nnoremap <Leader>/ :Ack!<Space>

" Navigate quickfix list easily
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>

" Easily close quickfix list
nnoremap <silent> <Leader>bc :cclose<CR>

" Descriptions of key maps for which-key plugin
let g:which_key_map = { '/': "Search" }

let g:which_key_map.b = { 'name': "+buffers" }
let g:which_key_map.b.c = "Close Quickfix List buffer"
let g:which_key_map.b.d = "Delete buffer w/o closing window"

let g:which_key_map.f = "File explorer"

let g:which_key_map.g = { 'name': "+goto" }
let g:which_key_map.g.b = "Go to buffer"
let g:which_key_map.g.d = "Go to definition"
let g:which_key_map.g.y = "Go to type definition"
let g:which_key_map.g.i = "Go to implementation"
let g:which_key_map.g.r = "Go to references"

let g:which_key_map.r = "Rename symbol"

let g:which_key_map.w = { 'name': "+windows" }
let g:which_key_map.w.s = "Split window below"
let g:which_key_map.w.v = "Split window right"
let g:which_key_map.w.r = "Swap windows"
let g:which_key_map.w.j = "Go to window below current"
let g:which_key_map.w.k = "Go to window above current"
let g:which_key_map.w.h = "Go to window to the left"
let g:which_key_map.w.l = "Go to window to the right"

call which_key#register('<Space>', "g:which_key_map")

" Setup which-key plugin key mapping
nnoremap <silent> <leader>          :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader>     :<c-u>WhichKey ','<CR>
