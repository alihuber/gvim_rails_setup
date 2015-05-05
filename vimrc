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

" Programming-language/environment specific settings in ./vimsauce/*.vimrc files
Plugin 'joonty/vim-sauce'
" Solarized colors
Plugin 'altercation/vim-colors-solarized'
" NERDTree plugin
Plugin 'scrooloose/nerdtree'
" Buffer explorer
Plugin 'jlanzarotta/bufexplorer'
" Airline statusline plugin
Plugin 'bling/vim-airline'
" Show most recent used files
Plugin 'vim-scripts/mru.vim'
" Needed for vim-session plugin
Plugin 'xolox/vim-misc'
" Session-Management: Open/SaveSession foo
Plugin 'xolox/vim-session'
" <leader>t fuzzy file search
Plugin 'wincent/command-t'
" Expands visual selection to next text object by repeating v
Plugin 'terryma/vim-expand-region'
" Undo tree, file changes over time
Plugin 'sjl/gundo.vim'
" Explore clipboard contents
Plugin 'vim-scripts/YankRing.vim'
" Show function/code block scope hints, toggle with <leader>ig
Plugin 'nathanaelkane/vim-indent-guides'
" Adds surroundings mnemonics ("Hello world") cs"' change surroundings -> 'Hello world'
Plugin 'tpope/vim-surround'
" Automatic closing of brackets
Plugin 'Raimondi/delimitMate'
" Commenting of lines/paragraphs with movement/text objects/counts, mapped to \\\ and gcc (gcap)
Plugin 'tpope/vim-commentary'
" Vim-Ruby plugin, adds shift-enter for blocks/methods, ]m next method, cim (change in method), vim (visual in method) etc.
Plugin 'vim-ruby/vim-ruby'
" Automatic 'end' insertion for Ruby development
Plugin 'tpope/vim-endwise'
" % matching for do ... end, if ... elsif .. end, RSpec's describe "" do ... end etc.
Plugin 'tmhedberg/matchit'
" CoffeeScript plugin
Plugin 'kchmck/vim-coffee-script'
" Slim template plugin
Plugin 'slim-template/vim-slim'
" Fugitive Git plugin for displaying git branch in Airline status bar
Plugin 'tpope/vim-fugitive'
" Git 'gutter' line changes indicators on the left, also used by Airline.
" Next/previous changed line: ]c/[c
" Stage line:        <leader>hs
" Revert stage:      <leader>hr
" Diff line changes: <leader>hp
Plugin 'airblade/vim-gitgutter'
" UltiSnips Plugin
Plugin 'SirVer/ultisnips'
" Snippets are separated from the UltiSnips engine.
Plugin 'honza/vim-snippets'
" MultiCursor Plugin <leader><d> place, <leader><e> edit, *no* <enter> needed
Plugin 'paradigm/vim-multicursor'
" TagBar Plugin
Plugin 'majutsushi/tagbar'
" Run RSpec tests out of vim, <leader>r whole file, <leader>R nearest, <leader> l latest
Plugin 'skalnik/vim-vroom'
" Python development
Plugin 'klen/python-mode'


" All of your plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ---- Solarized settings
set background=dark
" set usable colors when vim (not gvim) is started in terminal
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized
let g:solarized_contrast="high" "default value is normal
let g:solarized_visibility="high"

" ---- NERDTree plugin settings
map <leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" ---- Vim-Session plugin settings
let g:session_autosave = 'no'
let g:session_autoload = 'no'

" ---- Command-T plugin settings: max indexed files
let g:CommandTMaxFiles=50000

" ---- Toggle Gundo tree
map <leader>u :GundoToggle<cr>

" ---- Toggle YankRing
nmap <leader>y :YRShow<cr>

" ---- Toggle BufExplorer
nmap <leader>B :BufExplorer<cr>

" ---- Toggle most recent files
map <leader><enter> :Mru<cr>

" ---- Vim-Expand-Region mappings
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" ---- Indent-Guides settings
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size  = 1

" ---- Airline status bar settings
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_extensions                    = ['branch', 'hunks']
let g:airline#extensions#branch#enabled     = 1
let g:airline#extensions#hunks#enabled      = 1
let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']
let g:airline_theme                         ='powerlineish'
let g:airline_left_sep                      =''
let g:airline_right_sep                     =''
let g:airline_symbols.branch                = '⎇'

" ---- UltiSnips settings
let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-space>"
let g:UltiSnipsJumpBackwardTrigger="<c-s-space>"

" ---- MultiCursor settings
nnoremap <leader>d :<c-u>call MultiCursorPlaceCursor()<cr>
nnoremap <leader>e :<c-u>call MultiCursorManual()<cr>
nnoremap <Esc> :<c-u>call MultiCursorRemoveCursors()<cr>
let g:multicursor_quit = "<Esc>"

" ---- TagBar settings
nmap <F8> :TagbarToggle<CR>

" ---- vroom settings
let g:vroom_use_colors = 1


" *********************************************************************
" Basic editor configuration
" *********************************************************************
" Shorten messages + no welcome screen at startup
set shortmess=atIoOTts
" Get out of insert mode without esc
imap jk <Esc>
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


" *********************************************************************
" GUI and movement settings
" *********************************************************************
" Set syntax hightlighting on
syntax on
" Show entered commands in lower right corner like multipliers etc.
set showcmd
" Blink on matching parenthesis
set showmatch
" Instead of failing a command because of unsaved changes, instead raise a dialogue asking if you wish to save changed files.
set confirm
" Modelines have historically been a source of security vulnerabilities.  As such, it may be a good idea to disable them and use the securemodelines script.
set nomodeline
" Don't show mode a second time (done by Airline)
set noshowmode
" Hightlight cursor line
set cul
" Highlight unwanted spaces
set list!
set list listchars=tab:»-,trail:·,extends:»,precedes:«
" Set line numbers
set number
" Sets cursor info in lower right corner (line number, column number, %-position in document)
set ruler
" Shows 80 chars indicator
set colorcolumn=80
" Don't beep
set visualbell
set noerrorbells
" Font setting
set guifont=Monaco:h14
" Prevent cursor from moving to start of line when jumping between lines in buffer
set nostartofline
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
" Highlight search results
set hlsearch
" Highlight search results as you type
set incsearch
" Set the command window height to 1 lines
set cmdheight=1
" Always display the status line, even if only one window is displayed
set laststatus=2
" Show dots in front of line breaks
set showbreak=…
" j and k act on virtual lines (be able to move up into a wrapped line)
nnoremap j gj
nnoremap k gk


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
" Scroll downwards with Ctrl-z instead of Ctrl-y
nnoremap <C-z> <C-y>
" Window switching: Ctrl + movement, don't overwrite tab
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
