set shell=/bin/bash\ -i
set ruler
set colorcolumn=80
set showmode
" session handling
let g:session_autosave = 'no'
let g:session_autoload = 'no'

set tags=tags;/

" Needed on some linux distros.
" see http://www.adamlowe.me/2009/12/vim-destroys-all-other-rails-editors.html
map <D-]> :maca _cycleWindows:<CR>
map <D-[> :maca _cycleWindowsBackwards:<CR>

" The set nocompatible setting makes vim behave in a more useful way
set nocompatible

" include bundle with pathogen

filetype off
call pathogen#infect()
call pathogen#helptags()

" These are highly recommended options.
set enc=utf-8

" be able to have hidden buffers
set hidden

" Show partial commands while typing
set showcmd

" Enable filetype-specific indenting and plugins
filetype plugin indent on

" ##### COMPLETION
"set ofu=syntaxcomplete#Complete

imap <c-j> <c-x><c-o>
" Better command-line completion
set wildmenu
set wildignore+=*.pyc,*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov,*.git*
set wildmode=list:longest,full

" Completion settings in insertmode
set complete=.,w,b,t,i

" shorten messages + no welcome screen at startup; see :h shortmess for more
" info
set shortmess=atIoOTts

" hightlight cursor line
set cul

" not only backspace and cursor can go lines up or own
set ww=<,>,[,],h,l

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" --- Statusline Options
set statusline= "clear it first

" statusline
"set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %=\ lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:%b\ %P

" Always display the status line, even if only one window is displayed
set laststatus=2

" Set the command window height to 1 lines
set cmdheight=1

" but don't split words
set lbr

"show this in front of broken lines
set showbreak=…

" got scrolling problems? uncomment this
set ttyfast
set ttyscroll=1 " speed
set lazyredraw " to avoid scrolling problems

" show stuff at the left if not wrapping
set sidescrolloff=5
set sidescroll=1

" keep cursor distanced 3 lines till window ends
set scrolloff=3
" --- History Options

" Viminfo File
" Tell vim to remember certain things when we exit
"  '50  :  marks will be remembered for up to 50 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :100  :  up to 100 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='50,\"100,:100,n~/.viminfo

" automatically read file changed outside of Vim
set autoread

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Modelines have historically been a source of security vulnerabilities.  As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
set nomodeline

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Copy to Clipboard (on Unix)
set clipboard+=unnamed
"set clipboard+=+


" Turn syntax highlighting on
syntax on

" Highlight search results
set hlsearch

" Turn on line numbering
set number

" Make backspce behave more normally
set backspace=indent,eol,start

" Turn on automatic indenting
set smartindent

" copy the previous indentation on autoindenting
set copyindent

" set show matching parenthesis
set showmatch

" show search matches as you type
set incsearch

" Insert space characters whenever the tab key is pressed
set expandtab

" Set tabs
set tabstop=2
" Spaces feel like Tabs
set softtabstop=2
set shiftwidth=2

" when at 3 spaces, and I hit tab go to 4, not 5
set shiftround

" remember more commands and search history
set history=1000

" use many muchos levels of undo
set undolevels=1000
set undofile
set undodir=~/.undofilesvim

set wildignore=*.swp,*.bak,*.pyc,*.class

" change the terminal's title
set title

set visualbell           " don't beep
set noerrorbells         " don't beep

set nobackup
set noswapfile

set guifont=Monaco:h15
set background=dark
colorscheme solarized
let g:solarized_contrast="high"    "default value is normal
let g:solarized_visibility="high"
" if &t_Co >= 256 || has("gui_running")
"      colorscheme codeburn
" endif

if &t_Co > 2 || has("gui_running")
     " switch syntax highlighting on, when the terminal has colors
    syntax on
endif

" highlight unwanted spaces
set list!
"set listchars=tab:▷ ,trail:⋅,nbsp:⋅
"set listchars=eol:¬,nbsp:⋅,tab:>-,trail:⋅,extends:>,precedes:<
set list listchars=tab:»-,trail:·,extends:»,precedes:«


" MAPPINGS "

" each html tag at its own line
map <F7> :s/<[^>]*>/\r&\r/g<enter>
map <S-F7> :%s/<[^>]*>/\r&\r/g<enter>

" search for visually highlighted text
vmap // y/<C-R>"<CR>

map ,f :set foldmethod=indent<cr>zM<cr>
map ,F :set foldmethod=manual<cr>zR<cr>

" get out of insert mode
imap jk <Esc>

" toggle paste mode for code blocks in insert mode
set pastetoggle=<F2>

" Quickly edit/reload the vimrc file
nmap <silent> <F5> :e $MYVIMRC<CR>
nmap <silent> <S-F5> :so $MYVIMRC<CR>

" change the mapleader from \ to ,
let mapleader=","

" save with strg-s
map <c-s> <esc>:w<cr>
imap <c-s> <esc>:w<cr>a

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" j and k act in virtual lines
nnoremap j gj
nnoremap k gk

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" be able to write files with sudo
" cmap w!! w !sudo tee % >/dev/null

" wrapping toggle
" map <leader>w :set nowrap!<CR>

" Copy paste
map <leader>p "+p
cmap <leader>p <C-R>+
vnoremap <leader>y "+y

" fast closing of html tags
imap ;; </<Esc>a<c-x><c-o><c-l>

" Remappings

" Open help for word under cursor
map <F1> <ESC>:exec "help ".expand("<cword>")<CR>
" grep for a word in help
:nnoremap <s-F1>  :helpgrep<space>

map <s-space> <ESC>:exec "Ack ".expand("<cword>")<CR>

" grep for a word in help
" Nice Indentation by Shift-h/l
nmap < <<
nmap > >>
vmap < <gv
vmap > >gv

" allow command line editing like emacs
cnoremap <C-A>      <Home>
cnoremap <C-B>      <Left>
cnoremap <C-E>      <End>
cnoremap <C-F>      <Right>
cnoremap <C-N>      <End>
cnoremap <C-P>      <Up>

" remap Y to behave like C or D...
map Y y$

" delete char after cursor in insert mode, same as del key
inoremap <c-l> <del>

" jump to line AND column
nnoremap ' `
nnoremap ` '

" center match
map n nzz
map N Nzz

" tag bindings
nmap <cr> <c-w>g}
nmap <s-cr> <c-]>
nmap <c-cr> <c-t>

" display marks and jump to entered number
map <leader>m :marks<cr>:normal `

"cd to Projects directory
" map <leader>d :cd ~/git/

" save with strg-s
map <c-s> <esc>:w<cr>
imap <c-s> <esc>:w<cr>a

" move to next or previous buffer with ALT+hl
nmap <m-h> :bp<cr>
nmap <m-l> :bn<cr>

" Window resizing mappings
map <up> <C-W>-
map <down> <C-W>+
map <left> <c-w><
map <right> <c-w>>

" cicle through windows with tab
noremap <TAB>   <C-W>w
noremap <S-TAB> <C-W>W

" substitute word under cursor
map <leader>s :%s/<c-r><c-w>//g<left><left>

map <leader>g :vimgrep //gj ./**/*.*<left><left><left><left><left><left><left><left><left><left><left><left>

"show register contents
"map <leader>. :reg<cr>

"switch between relativ and absolute line numbers - try it!
"nnoremap <leader>l :call g:ToggleNuMode()<cr>

"function! g:ToggleNuMode()
"if(&rnu == 1)
"set nu
"else
"set rnu
"endif
"endfunc

"PLUGIN SETTINGS

" Tagbar
" nnoremap <silent> <leader>; :TagbarToggle<cr>

let g:acp_completeOption = '.,w,b,t,i,k'

" i want to switch windows with ctrl tab, not buffers
let g:Tb_cTabSwitchBufs = 0

" PLUGIN MAPPINGS
" ZEN

" ACK
map <leader>a :Ack!


" rails
" go to controller test etc
map <leader>ra :A<cr>


" go to controller helper etc
map <leader>rr :R<cr>
" open in browser
map <leader>rp :Rpreview<space>

map <leader>rf :find<space>
map <leader>rc :Rcontroller<cr>
map <leader>rh :Rhelper<cr>
map <leader>rl :Rlayout<cr>
map <leader>rd :Rmigration<cr>
map <leader>rm :Rmodel<cr>
map <leader>rs :Rstylesheet<cr>
map <leader>rv :Rview<cr>
map <leader>rj :Rjavascript<cr>
map <leader>re :Rextract<space>

" NERDTree
map <leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" toggle the Gundo window
map <leader>u :GundoToggle<cr>

" most recent files
map <leader><enter> :Mru<cr>

" show yankring
nmap <leader>y :YRShow<cr>
map <leader><F8> ?get<cr>lll~/set<cr>nlll~
map <leader><F9> :%s/\([gs]et\)\(\w\)\(\w\)/\1\U\2\L\3/g<cr><c-o>

let g:ruby_doc_ruby_mapping='KK'

nnoremap <leader>d :<c-u>call MultiCursorPlaceCursor()<cr>
nnoremap <leader>e :<c-u>call MultiCursorManual()<cr>
nnoremap <Esc> :<c-u>call MultiCursorRemoveCursors()<cr>
let g:multicursor_quit = "<Esc>"


" FILE TYPE SETTINGS
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" RoR
map <F9> <Esc>:set filetype=html.eruby-rails.eruby<cr>
let g:rubycomplete_rails = 1
autocmd FileType eruby set filetype=html.eruby-rails.eruby
autocmd FileType html set filetype=html.eruby-rails.eruby
autocmd FileType ruby set filetype=ruby.ruby-rails
"ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
map <f5> :w<CR>:!ruby %<CR>
"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold


" rails paths for gf to jump to classes
map <F11> <Esc>:set suffixesadd=.rb<CR>gf
map <F12> <Esc>:set suffixesadd=.html.erb<CR>gf
set suffixesadd=.rb
set includeexpr+=substitute(v:fname,'s$','','g')
" or you can add substitution pattern s/ies$/y/g, s/ves$/f/g like this:
" set includeexpr+=substitute(substitute(substitute(v:fname,'s$','','g'),'ie$','y','g'),'ve$','f','g')

" omnicompletion
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

"let g:Powerline_symbols = 'fancy'
"so ~/.companyrelatedvimrc


set errorformat+=\"%f\"\\,%l\\,%c\\,%t%*[a-zA-Z]\\,\"%m\"

" function! Smart_TabComplete()
"   let line = getline('.')                         " current line¬
"   let substr = matchstr(substr, "[^ \t]*$")       " word till cursor¬
"   if (strlen(substr)==0)                          " nothing to match on empty string¬
"     return "\<tab>"¬
"   endif¬
"   let has_period = match(substr, '\.') != -1      " position of period, if any¬
"   let has_gt = match(substr, '\>') != -1       " position of slash, if any¬
"   if ( has_gt )¬
"     return "\<C-X>\<C-O>"                         " file matching¬
"   elseif (!has_period && !has_slash)¬
"     return "\<C-X>\<C-P>"                         " existing text matching¬
"   elseif ( has_slash )¬
"     return "\<C-X>\<C-F>"                         " file matching¬
"   else¬
"     return "\<C-X>\<C-O>"                         " plugin matching¬
"   endif¬
" endfunction¬
" inoremap <tab> <c-r>=Smart_TabComplete()<CR>¬


" vroom and tmux settings
let g:vroom_use_spring = 1
let g:vroom_use_binstubs = 1
let g:vroom_use_vimux = 1
let g:VimuxHeight = "100"



" Preserve noeol (missing trailing eol) when saving file. In order
" to do this we need to temporarily 'set binary' for the duration of
" file writing, and for DOS line endings, add the CRs manually.
" For Mac line endings, also must join everything to one line since it doesn't
" use a LF character anywhere and 'binary' writes everything as if it were Unix.

" This works because 'eol' is set properly no matter what file format is used,
" even if it is only used when 'binary' is set.

augroup automatic_noeol
  au!
  au BufWritePre  * call <SID>TempSetBinaryForNoeol()
  au BufWritePost * call <SID>TempRestoreBinaryForNoeol()
augroup END

function! s:TempSetBinaryForNoeol()
  let s:save_binary = &binary
  if ! &eol && ! &binary
    let s:save_view = winsaveview()
    setlocal binary
    if &ff == "dos" || &ff == "mac"
      if line('$') > 1
        undojoin | exec "silent 1,$-1normal! A\<C-V>\<C-M>"
      endif
    endif
    if &ff == "mac"
      undojoin | %join!
      " mac format does not use a \n anywhere, so we don't add one when writing
      " in binary (which uses unix format always). However, inside the outer
      " if statement, we already know that 'noeol' is set, so no special logic
      " is needed.
    endif
  endif
endfunction

function! s:TempRestoreBinaryForNoeol()
  if ! &eol && ! s:save_binary
    if &ff == "dos"
      if line('$') > 1
        " Sometimes undojoin gives errors here, even when it shouldn't.
        " Suppress them for now...if you can figure out and fix them instead,
        " please update http://vim.wikia.com/wiki/VimTip1369
        silent! undojoin | silent 1,$-1s/\r$//e
      endif
    elseif &ff == "mac"
      " Sometimes undojoin gives errors here, even when it shouldn't.
      " Suppress them for now...if you can figure out and fix them instead,
      " please update http://vim.wikia.com/wiki/VimTip1369
      silent! undojoin | silent %s/\r/\r/ge
    endif
    setlocal nobinary
    call winrestview(s:save_view)
  endif
endfunction
