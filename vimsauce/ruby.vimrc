" vim commands, mappings, functions etc. for Ruby
" Set tab width
set tabstop=2
" Spaces as tabs
set softtabstop=2
set shiftwidth=2
" Execute Ruby scripts with F5
map <f5> :w<CR>:!ruby %<CR>
