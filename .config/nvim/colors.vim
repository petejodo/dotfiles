if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:green = { "gui": "#98c379", "cterm": "114", "cterm16": "2" }

    autocmd ColorScheme * call onedark#set_highlight("elixirDocTest", { "fg": s:green })
  augroup END
endif
