let g:mapleader = "\<Space>"
let g:maplocalleader = ","

" File-specific shortcuts
nnoremap <Leader>ff :Ranger<CR>

" Window-specific shortcuts
nnoremap <Leader>ws <C-W>s
nnoremap <Leader>wv <C-W>v
nnoremap <Leader>wr <C-W>R

" Descriptions of key maps for which-key plugin
let g:which_key_map = {}

let g:which_key_map.b = { 'name': "+buffers" }
let g:which_key_map.b.d = "Delete buffer w/o closing window"

let g:which_key_map.f = { 'name': "+files" }
let g:which_key_map.f.f = "Explore files, current tab"

let g:which_key_map.w = { 'name': "+windows" }
let g:which_key_map.w.s = "Split window below"
let g:which_key_map.w.v = "Split window right"
let g:which_key_map.w.r = "Swap windows"

call which_key#register('<Space>', "g:which_key_map")

" Setup which-key plugin key mapping
nnoremap <silent> <leader>          :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader>     :<c-u>WhichKey ','<CR>
