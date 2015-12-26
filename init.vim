" ***************************
" Python Interpreter settings
" ***************************
let g:python3_host_prog = '/usr/local/bin/python3'

" Change the mapleader from \ to ,
" leader has to be set on top of file to be used later on
let mapleader=","

" *********************************************************************
" Plugins
" *********************************************************************
if 0 | endif
if has('vim_starting')
  set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
endif
" Required
call neobundle#begin(expand('~/.config/nvim/bundle/'))

" Let NeoBundle manage NeoBundle, required
NeoBundleFetch 'Shougo/neobundle.vim'

"***************
" Editor/Gui plugins
"***************
" Better tabs for terminal vim
NeoBundle 'mkitt/tabline.vim'
" Programming-language/environment specific settings in ./vimsauce/*.vimrc files
NeoBundle 'flazz/vim-colorschemes'
" Other colorschemes
NeoBundle 'trusktr/seti.vim'
NeoBundle 'queyenth/oxeded.vim'
" NERDtree
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
" Class outline viewer, mapped to <leader>tb
NeoBundle 'majutsushi/tagbar'
" Buffer explorer mapped to <leader>B
NeoBundle 'jlanzarotta/bufexplorer'
NeoBundle 'bling/vim-airline'
" Show most recent used files, mapped to <leader>Enter
NeoBundle 'vim-scripts/mru.vim'
NeoBundle 'ctrlpvim/ctrlp.vim'
" Needed for vim-session plugin
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-session'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'nelstrom/vim-visual-star-search'
" Undo tree, mapped to <leader>u
NeoBundle 'sjl/gundo.vim'
" Explore clipboard contents, mapped to <leader>y
NeoBundle 'vim-scripts/YankRing.vim'
" Repeat line search with f, backwards with F
NeoBundle 'rhysd/clever-f.vim'
" Place cursor: <leader><d>, start editing: <leader><e>, finish with <Esc>
NeoBundle 'paradigm/vim-multicursor'
NeoBundle 'SirVer/ultisnips'
" Snippets are separated from the UltiSnips engine.
NeoBundle 'honza/vim-snippets'

"********************
" Plugins for editing
"********************
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'vim-scripts/visualrepeat'
" Expands visual selection to next text object by repeating v
NeoBundle 'terryma/vim-expand-region'
" Adds surroundings mnemonics ("Hello") cs"' change surroundings -> 'Hello'
NeoBundle 'tpope/vim-surround'
" Automatic closing of brackets
NeoBundle 'jiangmiao/auto-pairs'
" Commenting is mapped to \\\ and gcc (gcap)
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tmhedberg/matchit'
" EasyAlign plugin: mapped to a (visual mode) and ga (normal mode)
NeoBundle 'junegunn/vim-easy-align'
" Switch statements from single-line to multiline, mapped to sj and sk
NeoBundle 'AndrewRadev/splitjoin.vim'

"***************
" Git plugins
"***************
" Git plugin (for displaying git branch in Airline status bar)
NeoBundle 'tpope/vim-fugitive'
" Git 'gutter' line changes indicators on the left, also used by Airline.
" Next/previous changed line: ]c/[c
" Stage line:        <leader>hs
" Revert stage:      <leader>hr
" Diff line changes: <leader>hp
NeoBundle 'airblade/vim-gitgutter'

"**********************
" Programming languages
"**********************
" Adds shift-enter for blocks/methods, ]m next method, cim (change in method), vim (visual in method) etc.
NeoBundle 'vim-ruby/vim-ruby'
" Needed for vim-textobj-rubyblock
NeoBundle 'kana/vim-textobj-user'
" Adds e.g. vir for selecting block contents
NeoBundle 'nelstrom/vim-textobj-rubyblock'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'gabrielelana/vim-markdown'
NeoBundle 'avakhov/vim-yaml'
NeoBundle 'Slava/vim-spacebars'
NeoBundle 'scrooloose/syntastic'

call neobundle#end()

filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" ---- YouCompleteMe settings
let g:ctrlp_map = '<leader>t'
let g:ycm_collect_identifiers_from_tags_files = 1

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
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shortmess=atIoOTts
set hidden
set shell=/bin/bash
set wildignore+=*.pyc,*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov,*.git*,*.swp,*.bak,*.class
set wildmode=list:longest,full
set nobackup
set noswapfile


" *********************************************************************
" GUI and movement settings
" *********************************************************************
colorscheme jelleybeans
syntax on
set showcmd
set showmatch
set confirm
set nomodeline
set noshowmode
set cul
set list!
set list listchars=tab:»-,trail:·,extends:»,precedes:«
set number
set relativenumber
set ruler
set colorcolumn=80
set visualbell
set noerrorbells
set guifont=Monaco:h15
set nostartofline
set ignorecase
set smartcase
set cmdheight=1
set linebreak
set showbreak=…
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


" **************************************
" Global tab/spaces/indentation settings
" **************************************
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
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
