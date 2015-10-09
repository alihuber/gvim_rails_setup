" *********************************************************************
" Reminders
" *********************************************************************
" nmap     = map a key sequence when in normal mode
" <silent> = don't show a message when key sequence is used
" Keycodes
" http://vimdoc.sourceforge.net/htmldoc/intro.html#key-notation
" Omnicomplete
" <c-x><c-o> Language-wise omnicompletion
" <c-p> Tagfile/Buffer-wise omnicompletion
" Re-index Command-t:
" :CommandTFlush or <leader>t<c-f>


" Change the mapleader from \ to ,
" leader has to be set on top of file to be used later on
let mapleader=","

" Automatic reloading of .vimrc upon saving
augroup reload_vimrc " {
 autocmd!
 autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }


" *********************************************************************
" Plugins
" *********************************************************************
" Additional plugins in ~/.vim/plugin directory: IndexedSearch.vim,
" for displaying 'Match n of m'-messages while searching

" Be iMproved, required
set nocompatible
" Required for vundle
filetype off
" ---- Vundle setup
" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"***************
" Editor/Gui plugins
"***************
" Better tabs for terminal vim
Plugin 'mkitt/tabline.vim'
" Programming-language/environment specific settings in ./vimsauce/*.vimrc files
Plugin 'joonty/vim-sauce'
Plugin 'flazz/vim-colorschemes'
" Other colorschemes
Plugin 'trusktr/seti.vim'
Plugin 'queyenth/oxeded.vim'
Plugin 'scrooloose/nerdtree'
" Class outline viewer, mapped to <leader>tb
Plugin 'majutsushi/tagbar'
" Buffer explorer mapped to <leader>B
Plugin 'jlanzarotta/bufexplorer'
Plugin 'bling/vim-airline'
" Show most recent used files, mapped to <leader>Enter
Plugin 'vim-scripts/mru.vim'
" Needed for vim-session plugin
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'wincent/command-t'
Plugin 'rking/ag.vim'
Plugin 'nelstrom/vim-visual-star-search'
" Undo tree, mapped to <leader>u
Plugin 'sjl/gundo.vim'
" Explore clipboard contents, mapped to <leader>y
Plugin 'vim-scripts/YankRing.vim'
" Repeat line search with f, backwards with F
Plugin 'rhysd/clever-f.vim'
" Place cursor: <leader><d>, start editing: <leader><e>, finish with <Esc>
Plugin 'paradigm/vim-multicursor'
Plugin 'SirVer/ultisnips'
" Snippets are separated from the UltiSnips engine.
Plugin 'honza/vim-snippets'

"********************
" Plugins for editing
"********************
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-scripts/visualrepeat'
" Expands visual selection to next text object by repeating v
Plugin 'terryma/vim-expand-region'
" Adds surroundings mnemonics ("Hello") cs"' change surroundings -> 'Hello'
Plugin 'tpope/vim-surround'
" Automatic closing of brackets
Plugin 'jiangmiao/auto-pairs'
" Commenting is mapped to \\\ and gcc (gcap)
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tmhedberg/matchit'
" EasyAlign plugin: mapped to a (visual mode) and ga (normal mode)
Plugin 'junegunn/vim-easy-align'
" Switch statements from single-line to multiline, mapped to sj and sk
Plugin 'AndrewRadev/splitjoin.vim'

"***************
" Git plugins
"***************
" Git plugin (for displaying git branch in Airline status bar)
Plugin 'tpope/vim-fugitive'
" Git 'gutter' line changes indicators on the left, also used by Airline.
" Next/previous changed line: ]c/[c
" Stage line:        <leader>hs
" Revert stage:      <leader>hr
" Diff line changes: <leader>hp
Plugin 'airblade/vim-gitgutter'

"**********************
" Programming languages
"**********************
" Adds shift-enter for blocks/methods, ]m next method, cim (change in method), vim (visual in method) etc.
Plugin 'vim-ruby/vim-ruby'
" Needed for vim-textobj-rubyblock
Plugin 'kana/vim-textobj-user'
" Adds e.g. vir for selecting block contents
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'kchmck/vim-coffee-script'
Plugin 'slim-template/vim-slim'
" Run RSpec tests out of vim
Plugin 'skalnik/vim-vroom'
" Controlling tmux out of vim
Plugin 'benmills/vimux'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'klen/python-mode'
Plugin 'gabrielelana/vim-markdown'
Plugin 'avakhov/vim-yaml'
Plugin 'Slava/vim-spacebars'
Plugin 'scrooloose/syntastic'

" All of your plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ---- NERDTree plugin settings
map <leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" ---- Vim-Session plugin settings
let g:session_autosave = 'no'
let g:session_autoload = 'no'

" ---- Command-T plugin settings: max indexed files
let g:CommandTMaxFiles=50000

" ---- Gundo plugin settings
map <leader>u :GundoToggle<cr>

" ---- YankRing plugin settings
nmap <leader>y :YRShow<cr>

" ---- BufExplorer plugin settings
nmap <leader>B :BufExplorer<cr>

" ---- MRU (most recent used files) plugin settings
map <leader><enter> :Mru<cr>

" ---- Vim-Expand-Region plugin settings
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" ---- Airline status bar plugin settings
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_extensions                    = ['branch', 'hunks', 'syntastic']
let g:airline#extensions#branch#enabled     = 1
let g:airline#extensions#hunks#enabled      = 1
let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']
let g:airline#extensions#syntastic#enabled  = 1
let g:airline_theme                         ='powerlineish'
let g:airline_left_sep                      =''
let g:airline_right_sep                     =''
let g:airline_symbols.branch                = '⎇'

" ---- UltiSnips plugin settings
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

" ---- MultiCursor plugin settings
nnoremap <leader>d :<c-u>call MultiCursorPlaceCursor()<cr>
nnoremap <leader>e :<c-u>call MultiCursorManual()<cr>
nnoremap <Esc> :<c-u>call MultiCursorRemoveCursors()<cr>
let g:multicursor_quit = "<Esc>"

" ---- TagBar plugin settings
nmap <Leader>tb :TagbarToggle<CR>

" ---- Vroom plugin settings
let g:vroom_spec_command = "rspec --format progress"
" Overwrite standard mappings
let g:vroom_map_keys        = 0
let g:vroom_use_colors      = 1
let g:vroom_use_binstubs    = 1
let g:vroom_use_vimux       = 1

"---- Vimux plugin settings
let g:VimuxHeight = "40"
" Run current RSpec file
map <Leader>rf :VroomRunTestFile<CR>
" Run nearest RSpec test
map <Leader>rn :VroomRunNearestTest<CR>
" Prompt for a command to run
map <Leader>rp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>rl :VimuxRunLastCommand<CR>
" Inspect runner pane
map <Leader>ri :VimuxInspectRunner<CR>
" Close vim tmux runner opened by VimuxRunCommand
map <Leader>rq :VimuxCloseRunner<CR>
" Interrupt any command running in the runner pane
map <Leader>rx :VimuxInterruptRunner<CR>
" Zoom the runner pane (use <bind-key> z to restore runner pane)
map <Leader>rz :call VimuxZoomRunner()<CR>

"---- Clever-f plugin settings
let g:clever_f_fix_key_direction = 1

"---- EasyAlign plugin settings
" Start interactive EasyAlign in visual mode (e.g. vip<a>)
vmap a <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"---- Vim-Markdown plugin settings
let g:markdown_enable_spell_checking = 0

"---- Vim-Mustache-Handlebars plugin settings
let g:mustache_abbreviations = 1

"---- SplitJoin plugin settings
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

"---- Syntastic plugin settings
let g:syntastic_error_symbol = "✗"
" Disable slow linters
let g:syntastic_mode_map = { 'passive_filetypes': ['slim', 'scss'] }

"--- Gitgutter plugin settings
let g:gitgutter_max_signs=1000

" *********************************************************************
" Basic editor configuration
" *********************************************************************
" Set tab width
set tabstop=2
" Spaces as tabs
set softtabstop=2
set shiftwidth=2
" Shorten messages + no welcome screen at startup
set shortmess=atIoOTts
" Encoding
set enc=utf-8
" Be able to have hidden buffers
set hidden
" Shell to execute scripts
set shell=/bin/bash\ -i
" Better command-line completion (e.g. :color <tab>)
set wildmenu
set wildignore+=*.pyc,*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov,*.git*,*.swp,*.bak,*.class
set wildmode=list:longest,full
" Automatically read file changed outside of Vim
set autoread
" Don't create swp and ~ files
set nobackup
set noswapfile
" Standard name of ctags file, normally in project root
set tags=tags;/
" Associate ECMAScript6 files with JavaScript file type
autocmd BufRead,BufNewFile *.es6 setfiletype javascript

" *********************************************************************
" GUI and movement settings
" *********************************************************************
" Colorscheme for terminal vim
colorscheme jelleybeans
" Set syntax highlighting on
syntax on
" Show entered commands in lower right corner like multipliers etc.
set showcmd
" Blink on matching parenthesis
set showmatch
" Instead of failing a command because of unsaved changes, instead raise a dialogue asking if you wish to save changed files.
set confirm
" Modelines have historically been a source of security vulnerabilities. As such, it may be a good idea to disable them and use the securemodelines script.
set nomodeline
" Don't show mode (already in Airline)
set noshowmode
" Highlight cursor line
set cul
" Highlight unwanted spaces
set list!
set list listchars=tab:»-,trail:·,extends:»,precedes:«
" Set both line numbers and relative line numbers
set number
set relativenumber
" Sets cursor info in lower right corner (line number, column number, %-position in document)
set ruler
" Shows 80 chars indicator
set colorcolumn=80
" Don't beep
set visualbell
set noerrorbells
" Font setting
set guifont=Monaco:h15
" Prevent cursor from moving to start of line when jumping between lines in buffer
set nostartofline
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
" Highlight search results
set hlsearch
" Highlight search results as you type
set incsearch
" Set the command window height to 1 line
set cmdheight=1
" Always display the status line, even if only one window is displayed
set laststatus=2
" Do word wrapping
set linebreak
" Show dots in front of line breaks
set showbreak=…
" Show diffs in vertical buffers
set diffopt=vertical


" *********************************************************************
" Omnicompletion (Ctrl-p) settings
" *********************************************************************
" Completion settings in insert mode
" . = current buffer
" w = buffers in other windows
" b = other loaded buffers
" u = unloaded buffers
" t = tags
" i = included files
set complete=.,w,b,t,i
" Improve omnicompletion menu color
highlight Pmenu ctermbg=238 gui=bold
" In omnicompletion box: don't replace entered text with suggestion
set completeopt=longest,menuone


" *********************************************************************
" Undo and history settings
" *********************************************************************
" remember more commands and search history
set history=1000
set undolevels=1000
set undofile
set undodir=~/.undofilesvim
" Viminfo file
" Tell vim to remember certain things when we exit
" '50  :  marks will be remembered for up to 50 previously edited files
" "100 :  will save up to 100 lines for each register
" :100  :  up to 100 lines of command-line history will be remembered
" %    :  saves and restores the buffer list
" n... :  where to save the viminfo files
set viminfo='50,\"100,:100,n~/.viminfo


" *********************************************************************
" Global tab/spaces/indentation settings. Settings per environment/programming
" language are set in specific 'sauce' files managed by vim-sauce plugin.
" *********************************************************************
" Insert space characters whenever the tab key is pressed
set expandtab
" When at 3 spaces, and I hit tab go to 4 not 5
set shiftround
" Turn on automatic indenting
set smartindent
" Copy the previous indentation on autoindenting
set copyindent


" *********************************************************************
" Global remappings
" *********************************************************************
" Get out of insert mode without Esc
imap jk <Esc>
" j and k act on virtual lines (be able to move up into a wrapped line)
nnoremap j gj
nnoremap k gk
" Scroll downwards with Ctrl-z instead of Ctrl-y
nnoremap <C-z> <C-y>
" Window switching: Ctrl + movement
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Copy and paste with <leader>-<y>(ank) and <leader>-<p>(aste)
map <leader>p "+p
cmap <leader>p <C-R>+
vnoremap <leader>y "+y
" Allows to paste clipboard content of operating system with above command
set clipboard+=unnamed
" Substitute word under cursor
map <leader>s :%s/<c-r><c-w>//g<left><left>
" Window resizing mappings, also disables the arrow keys
map <up> <C-W>-
map <down> <C-W>+
map <left> <c-w><
map <right> <c-w>>
" ctags -  Remap jump back from tag definition to Ctrl-P
map <C-P> <C-T>
" 12<Enter> jump to line 12, <Enter>=end of file, <Backspace>=beginning of file
nnoremap <CR> G
nnoremap <BS> gg
" Easier tab navigation
nnoremap th  :tabfirst<CR>
nnoremap tn  :tabnext<CR>
nnoremap tp  :tabprev<CR>
nnoremap tl  :tablast<CR>

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

" Delete hidden buffers
function! DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction

command! DeleteHiddenBuffers execute "call DeleteHiddenBuffers()"

" Automatically clean fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete
