" vim commands, mappings, functions etc. for Python
" Set tab width
set tabstop=4
" Spaces as tabs
set softtabstop=4
set shiftwidth=4
" Execute Python scripts with F5
map <f5> :w<CR>:!python3 %<CR>
