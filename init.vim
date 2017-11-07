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


" *********************************************************************
" Python Interpreter settings
" *********************************************************************
let g:python_host_prog = '/usr/bin/python'


" Change the mapleader from \ to ,
let mapleader=","


" *********************************************************************
" Plugins setup
" *********************************************************************
if 0 | endif
if has('vim_starting')
  set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
endif
" Required
call neobundle#begin(expand('~/.config/nvim/bundle/'))

" Let NeoBundle manage NeoBundle, required
NeoBundleFetch 'Shougo/neobundle.vim'


" *********************************************************************
" Editor/Gui plugins
" *********************************************************************
" Better tabs for terminal vim
NeoBundle 'mkitt/tabline.vim'
" NERDtree and plugins
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
" Class outline viewer, mapped to <leader>tb
NeoBundle 'majutsushi/tagbar'
" Buffer explorer mapped to <leader>B
NeoBundle 'jlanzarotta/bufexplorer'
" Airline statusline plugin
NeoBundle 'bling/vim-airline'
" Show most recent used files, mapped to <leader>Enter
NeoBundle 'vim-scripts/mru.vim'
" Ctrlp fuzzy file finder plugin
NeoBundle 'ctrlpvim/ctrlp.vim'
" Needed for vim-session plugin
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-session'
" Code completion
NeoBundle 'Valloric/YouCompleteMe'
" Searches from visual selections
NeoBundle 'nelstrom/vim-visual-star-search'
" Undo tree, mapped to <leader>u
NeoBundle 'sjl/gundo.vim'
" Explore clipboard contents, mapped to <leader>y
NeoBundle 'vim-scripts/YankRing.vim'
" Repeat line search with f, backwards with F
NeoBundle 'rhysd/clever-f.vim'
" <leader><leader><movement><char>
NeoBundle 'easymotion/vim-easymotion'
" Multiple cursors. Place cursor: <leader><d>, start editing: <leader><e>, finish with <Esc>
NeoBundle 'paradigm/vim-multicursor'
" Code snippets
NeoBundle 'SirVer/ultisnips'
" Snippets are separated from the UltiSnips engine.
NeoBundle 'honza/vim-snippets'
" Syntax checking plugin
NeoBundle 'scrooloose/syntastic'


" *********************************************************************
" Plugins for editing
" *********************************************************************
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'vim-scripts/visualrepeat'
" Expands visual selection to next text object by repeating v
NeoBundle 'terryma/vim-expand-region'
" Adds surroundings mnemonics ("Hello") cs"' change surroundings -> 'Hello'
NeoBundle 'tpope/vim-surround'
" Automatically close brackets
NeoBundle 'jiangmiao/auto-pairs'
" Automatically close HTML/XML-tags
NeoBundle 'alvan/vim-closetag'
" Commenting is mapped to \\\ and gcc (gcap)
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tmhedberg/matchit'
" EasyAlign plugin: mapped to a (visual mode) and ga (normal mode)
NeoBundle 'junegunn/vim-easy-align'
" Switch statements from single-line to multiline, mapped to sj and sk
NeoBundle 'AndrewRadev/splitjoin.vim'
" Indent Guides Plugin, trigger with <leader>ig
NeoBundle 'nathanaelkane/vim-indent-guides'


" *********************************************************************
" Git plugins
" *********************************************************************
" Git plugin (for displaying git branch in Airline status bar)
NeoBundle 'tpope/vim-fugitive'
" Git 'gutter' line changes indicators on the left, also used by Airline.
" Next/previous changed line: ]c/[c
" Stage line:        <leader>hs
" Revert stage:      <leader>hr
" Diff line changes: <leader>hp
NeoBundle 'airblade/vim-gitgutter'


" *********************************************************************
" Other programming languages stuff
" *********************************************************************
NeoBundle 'avakhov/vim-yaml'
NeoBundle 'gabrielelana/vim-markdown'
NeoBundle 'ap/vim-css-color'

" *********************************************************************
" JavaScript/TypeScript stuff
" *********************************************************************
" Tern completer for JavaScript
NeoBundle 'ternjs/tern_for_vim'
" Support for jade/pug templates
NeoBundle 'digitaltoad/vim-pug'
" Support for mustache/handlebars templates
NeoBundle 'Slava/vim-spacebars'
" This is needed by tsuquyomi
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
" TypeScript-autocompletion
NeoBundle 'Quramy/tsuquyomi'
" TypeScript syntax highlighting
NeoBundle 'HerringtonDarkholme/yats.vim'
" Pretty ES6 template strings
NeoBundle 'Quramy/vim-js-pretty-template'

" *********************************************************************
" ReactJS-stuff
" *********************************************************************
NeoBundle 'mxw/vim-jsx'


call neobundle#end()

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


" ---- CtrlP settings
let g:ctrlp_map = '<leader>t'
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 40
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0

" ---- YouCompleteMe settings
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
" Unset YouCompleteMe entry switching with <tab>,
" interferes with UltiSnips
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>

" ---- NERDTree plugin settings
map <leader>n :NERDTreeTabsToggle<CR>
map <leader>nf :NERDTreeTabsFind<CR>
let NERDTreeShowHidden=1
let nerdtree_tabs_autofind=1

" ---- Vim-Session plugin settings
let g:session_autosave = 'no'
let g:session_autoload = 'no'

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

" ---- Clever-f plugin settings
let g:clever_f_fix_key_direction = 1

" ---- EasyAlign plugin settings
" Start interactive EasyAlign in visual mode (e.g. vip<a>)
vmap a <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" ---- Vim-Markdown plugin settings
let g:markdown_enable_spell_checking = 0

" ---- Vim-Mustache-Handlebars plugin settings
let g:mustache_abbreviations = 1

" ---- SplitJoin plugin settings
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

" ---- Syntastic plugin settings
let g:syntastic_error_symbol = "✗"
" Disable slow linters
let g:syntastic_mode_map = { 'passive_filetypes': ['slim', 'scss'] }
let g:tsuquyomi_disable_quickfix = 1
" You shouldn't use 'tsc' checker
let g:syntastic_typescript_checkers = ['tsuquyomi']
let g:syntastic_javascript_checkers = ['eslint']

" ---- visSum plugin settings
nmap <silent> <unique> <Leader>m <Plug>SumNum
vmap <silent> <unique> <Leader>m <Plug>SumNum

" ---- Gitgutter plugin settings
let g:gitgutter_max_signs=1000

" ---- tern plugin settings
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'

" ---- Allow JSX in normal JS files
let g:jsx_ext_required = 1

" ---- Closetag settings
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx'


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
" Be able to have hidden buffers
set hidden
set shell=/bin/bash
set wildignore+=*.pyc,*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov,*.git*,*.swp,*.bak,*.class
set wildmode=list:longest,full
set nobackup
set noswapfile


" *********************************************************************
" GUI and movement settings
" *********************************************************************
colorscheme PaperColor
set background=dark
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
set guifont=Inconsolata:h19
" Prevent cursor from moving to start of line when jumping between lines in buffer
set nostartofline
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
" Set the command window height to 1 line
set cmdheight=1
" Do word wrapping
set linebreak
" Show dots in front of line breaks
set showbreak=…
" Show diffs in vertical buffers
set diffopt=vertical
" No scroll bar
set guioptions-=r


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
" Global tab/spaces/indentation settings
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
" Terminal window remappings
:tnoremap <Esc> <C-\><C-n>
:tnoremap <A-h> <C-\><C-n><C-w>h
:tnoremap <A-j> <C-\><C-n><C-w>j
:tnoremap <A-k> <C-\><C-n><C-w>k
:tnoremap <A-l> <C-\><C-n><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l
" Source bash_profile in embedded terminal
nnoremap <leader>z :new<CR>:terminal<CR>source $HOME/.bash_profile<CR>c<CR>
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
" Visual mode dot command tweak
vnoremap . :norm.<CR>
" Copy file path
nnor <leader>cp :let @*=expand("%:p")<CR>

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

" Omnicompletion settings
set omnifunc=syntaxcomplete#Complete
