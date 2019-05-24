""""""""""""""""""""""""""""
"" INIT
""""""""""""""""""""""""""""
let mapleader = ','

" auto-reload .vimrc on save
au BufWritePost .vimrc so ~/.vimrc
autocmd BufWritePost .vimrc source % | echo "Reloaded ~/.vimrc"

" VIM-PLUG
" DOCS https://github.com/junegunn/vim-plug#usage
" auto-install if missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif
" do magic
call plug#begin('~/.vim/bundle')
" MAKE SURE OF USING SINGLE QUOTES
Plug 'ctrlpvim/ctrlp.vim', { 'on': ['CtrlP','CtrlPBuffer','CtrlPMixed'] }
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'junegunn/goyo.vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
call plug#end()  " will auto-init syntax & plugin system


""""""""""""""""""""""""""""
"" GENERAL
""""""""""""""""""""""""""""
syntax on                  " enable syntax hilighing
filetype plugin indent on  " enable filetype plugins

set history=1000           " set history size
set undolevels=1000        " undo history size
set autoread               " auto-load file changes from other programs
set ruler                  " always show current position
set cmdheight=1            " height of command bar
set lazyredraw             " dont redraw while executing macros (+1 performance)
set showmatch              " show matching brackets
set magic                  " turn on magic for regex
set confirm                " prompt confirmation dialogs
set noerrorbells           " beep or flash screen on error / disable noerrorbells
set novisualbell           " no beeping

" configure backspace so it acts as it should act
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

set encoding=utf8          " encoding
set ffs=unix,dos,mac       " standard file type priorities
set expandtab              " tabs -> spaces
set smarttab		           " be smart about tabs
set shiftwidth=2           " tab width
set tabstop=2              " tab width
set autoindent smartindent " good indentation
set wrap                   " wrap lines
set autochdir              " change working directory to open buffer

" turn off backup
set nobackup
set nowb
set noswapfile

" use tab for auto completion
imap <Tab> <C-R>=SuperTab()<CR>

" auto completion menu
set wildmode=longest,list,full
set wildmenu
" dont auto-complete unimportant files
set wildignore=*.a,*.o,*.pyc
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*~,*.swp,*.tmp


""""""""""""""""""""""""""""
"" SEARCH
""""""""""""""""""""""""""""

set ignorecase             " case-insensitive search
set smartcase              " be smart about cases in search
set incsearch              " highlight match while typing search pattern
set nohlsearch             " do not keep highlighting
set grepprg=grep\ -nH\ $*  " search program
" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


""""""""""""""""""""""""""""
"" UI
""""""""""""""""""""""""""""

"set number                 " line numbers
set numberwidth=5          " line numbers width
set background=dark
set scrolljump=5           " When scrolling up/down jump 5 lines at once
set scrolloff=5            " when scrolling up/down keep 5 lines off
set cursorline             " show the cursor line
" set foldcolumn=1          " left-margin

try
  "colorscheme ayman
catch
  colorscheme default
endtry

set laststatus=2         " always show status bar
" status bar configuration
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

"Highlight tailling whitespace
highlight WhitespaceEOL ctermbg=Red guibg=Red
match WhitespaceEOL /\s\+$/
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"au InsertLeave * match ExtraWhitespace /\s\+$/

" Enable mouse support in console
if has("mouse")
  set mouse=a
endif


""""""""""""""""""""""""""""
"" MOVING AROUND
""""""""""""""""""""""""""""

" Esc == jk
inoremap jk <esc>
inoremap kj <esc>

" search shortcuts
map <space> /
map <c-space> ?

" managing tabs
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>tt :tabnext<cr>
map <leader>tm :tabmove<cr>

" managing splits
nmap <leader>ws  :split<cr>
nmap <leader>wv  :vsplit<cr>
nmap wl <c-w>l
nmap wh <c-w>h
nmap wj <c-w>j
nmap wk <c-w>k
nmap wx <c-w>x

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""
"" MAPPINGS
""""""""""""""""""""""""""""

" go to the first non-blank character
map 0 ^
" save file
noremap <leader>w <esc>:call CleanExtraSpaces()<cr>:w<cr>
" quite file
noremap <leader>q <esc>:q<CR>

" Better indentation shortcut
vnoremap <tab> >gv
vnoremap <s-tab> <gv
inoremap <s-tab> <c-d>

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" delete trailing white space on save (only for supported files)
autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()


""""""""""""""""""""""""""""
"" HELPERS
""""""""""""""""""""""""""""

" delete trailing white
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

" tab completion
function! SuperTab()
    if (strpart(getline('.'),col('.')-2,1)=~'^\W\?$')
        return "\<Tab>"
    else
        return "\<C-n>"
    endif
endfunction

" returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


""""""""""""""""""""""""""""
"" PLUGIN CONFIGURATION
""""""""""""""""""""""""""""
" ctrlp         https://github.com/ctrlpvim/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" python-mode   https://github.com/python-mode/python-mode/blob/develop/doc/pymode.txt
let g:pymode=1                         " turn it on
let g:pymode_python = 'python3'        " python version
let g:pymode_trim_whitespaces = 1      " trim white space on save
let g:pymode_indent = 1                " PEP8 indent
let g:pymode_doc = 1                   " turns on the documentation script
let g:pymode_virtualenv = 1            " enable automatic virtualenv detection
let g:pymode_breakpoint = 1            " enable BreakPoint funcionality
let g:pymode_breakpoint_bind = '<leader>b'  " keybind breakpoint
"let g:pymode_breakpoint_cmd = ''      " manually set breakpoint command (leave empty for automatic detection)
let g:pymode_lint = 0                  " trun on/off code checking
let g:pymode_lint_on_fly = 1           " lint on the fly
let g:pyomde_lint_message = 1          " show error message if cursor placed at the error
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'pylint'] " default code checkers
let g:pymode_syntax = 1                " activate pymode syntax
let g:pymode_syntax_all = 1            " enable all highlights
let g:pymode_rope = 0                  " deactivate rope
" let g:pymode_rope_completion = 1
" let g:pymode_rope_completion_on_dot = 1
" let g:pymode_rope_completion_bind = '<C-Space>'
" let g:pymode_rope_autoimport = 1
" let g:pymode_rope_show_doc_bind = '<Leader>D'
" let g:pymode_rope_goto_definition_bind = '<Leader>g'
" let g:pymode_rope_lookup_project = 0

" goyo        https://github.com/junegunn/goyo.vim#usage
noremap <M-z> :Goyo<cr>
let g:goyo_width=100
let g:goyo_height='90%'

" vim-gutter  https://github.com/airblade/vim-gitgutter
set updatetime=100                     " refresh delay in ms
let g:gitgutter_max_signs = 500        " do not show signs for buffers with +xxx changes
" jumping between hunks
nmap gn <Plug>GitGutterNextHunk
nmap gp <Plug>GitGutterPrevHunk
" staging hunks
nmap gha <Plug>GitGutterStageHunk
nmap ghu <Plug>GitGutterUndoHunk
" preview hunks
nmap ghp <Plug>GitGutterPreviewHunk
" folding hunks
nmap gf :GitGutterFold<cr>

" vim-airline  https://github.com/airblade/vim-gitgutter
let g:airline#extensions#tabline#formatter = 'default'  " format file paths in tabs and current buffer in the upper right
let g:airline#extensions#whitespace#enabled = 1         " whitespace count
"let g:airline_statusline_ontop = 1                      " move the status bar to the top
"let g:airline#extensions#tabline#enabled = 1            " enable cooler tabs
"let g:airline#extensions#tabline#left_sep = ' '         " tab separator
"let g:airline#extensions#tabline#left_alt_sep = '|'     " tab separator
" customize sections        https://github.com/vim-airline/vim-airline#fine-tuned-configuration
" customize accent colors   https://github.com/vim-airline/vim-airline/issues/299#issuecomment-25772886

" vim-airline-themes    https://github.com/vim-airline/vim-airline-themes
"let g:airline_theme = 'solarized'
