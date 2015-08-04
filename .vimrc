let mapleader = ','

"Automatically reload vimrc when it's saved
"URL= http://vimbits.com/bits/128
"au BufWritePost .vimrc so ~/.vimrc
autocmd bufwritepost .vimrc source %

" Esc == jk
inoremap jk <esc>
inoremap kj <esc>

inoremap ( ()<esc>i
inoremap { {}<esc>i
inoremap [ []<esc>i
inoremap ' ''<esc>i
inoremap " ""<esc>i
inoremap ` ``<esc>i
" PHP HTML
inoremap <? <?php  ?><esc>i<left><left>
inoremap </ </ ><esc>i<left>
inoremap <pre <pre><CR><CR></pre><up><tab>

map <Leader>c <esc><home>i#<esc>
map <Leader><S-c> <esc><home><del>

" Navigate Tabs
map <Leader><Space> <esc>:tabnext<CR>
map <Leader>: <esc>:tabprevious<CR>
" Navigate Splits
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h

map <Leader>n <esc>:tabnew<CR>   " new tab
map <Leader>; <esc>:tabclose<CR> " close tab
map <Leader>w <esc>:call <SID>StripTrailingWhitespaces()<CR>:w<CR>  " Remove Whitespaces and save
map <Leader>q <esc>:q<CR>           " Quit

" Better indentation shortcut
vnoremap < >gv    " +indent
vnoremap > <gv    " -indent

" I want my standard copy/paste :3
"set pastetoggle=<F2>
"set clipboard=unamedplus

" Spaces are good people v:
set tabstop=30
set softtabstop=3 " Num of spaces for each Tab
set shiftwidth=3  " Number of spaces for each auto-indent step
set shiftround
set expandtab
set smarttab
set showmatch     " Matching brackets
set autoindent smartindent
set number     "line numbering
" set textwidth=90
set background=dark "vim will auto-set colors depending on dark/light bg
set scrolljump=5    " When scrolling up/down jump 5 lines at once
set scrolloff=5     " when scrolling up/down keep 5 lines off
set cursorline      " show the cursor line


"Remove all the tailling whitespace
"URL= http://vimcasts.org/episodes/tidying-whitespace/
function! <SID>StripTrailingWhitespaces()
         " Preparation: save last search, and cursor position.
         let _s=@/
         let l = line(".")
         let c = col(".")
         " Do the business:
         %s/\s\+$//e
         " Clean up: restore previous search history, and cursor position
         let @/=_s
         call cursor(l, c)
endfunction
map <F10> call <SID>StripTrailingWhitespaces()

"Highlight tailling whitespace
"URL= http://vimbits.com/bits/259
highlight WhitespaceEOL ctermbg=Red guibg=Red
match WhitespaceEOL /\s\+$/
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"au InsertLeave * match ExtraWhitespace /\s\+$/

" Needed for Syntax Highlighting and stuff
filetype on
filetype plugin indent on
syntax on
set grepprg=grep\ -nH\ $*


" Enable mouse support in console
if has("mouse")
    set mouse=a
endif

"Use tab for auto completion
"URL= http://vimbits.com/bits/46
function! SuperTab()
    if (strpart(getline('.'),col('.')-2,1)=~'^\W\?$')
        return "\<Tab>"
    else
        return "\<C-n>"
    endif
endfunction
imap <Tab> <C-R>=SuperTab()<CR>

"Better TAB completion for files (emulates shell)
"URL= http://vimbits.com/bits/274
if has("wildmenu")
    set wildmode=longest,list,full
    set wildmenu
    " Ignore stuff (for TAB autocompletion)
    "set wildignore+=*.a,*.o
    "set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
    "set wildignore+=.DS_Store,.git,.hg,.svn
    set wildignore+=*~,*.swp,*.tmp
endif


"Run Python Code from Vim
"URL= http://vimbits.com/bits/85
map <F5> <esc>:w<CR>:!clear<CR>:!python %<CR>

"Run Bash script from Vim
map <F6> :w<CR>:!clear<CR>:!bash %<CR>

"Pretify JSON  Auto-format
"URL= http://vimbits.com/bits/473
command! F :%!python -m json.tool



"############################################################################
"##            PLUGINGS  -- Python IDE
"############################################################################


" Pathogen for managing plugings
" mkdir -p ~/.vim/autoload ~/.vim/bundle
"curl -Sso ~/.vim/autoload/pathogen.vim
"https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
execute pathogen#infect()
filetype plugin indent on
syntax on


" Vim-powerline
" cd ~/.vim/bundle/ && git clone https://github.com/Lokaltog/vim-powerline.git
set laststatus=2
let g:Powerline_cache_enabled = 1
"let g:Powerline_theme = 'solarized16'
"let g:Powerline_colorscheme = 'solarized16'

" Setup ctrlp
" cd ~/.vim/bundle/ && git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_hight = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" python-mode
" cd ~/.vim/bundle/ && git clone it://github.com/klen/python-mode.git
let g:pymode_lint = 1  " Trun ON code checking
let g:pymode_lint_on_fly = 1  " Check cod when editing (On the fly)
let g:pyomde_lint_message = 1  " Show error message if cursor placed at the error line
let g:pymode_breakpoint = 1  " Enable BreakPoint funcionality
let g:pymode_breakpoint_bind = '<Leader>b'  " Map breakpoint
let g:pymode_breakpoint_cmd = ''  " Manually set breakpoint command (leave empty for automatic detection)
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1  " Enable ALL python highlightings
let g:pymode_folding = 1
" ----- Pymode supports Rope refactoring operations, code completion and code assists.
let g:pymode_rope = 1  " Enable the Rope plugin
let g:pymode_rope_show_doc_bind = '<Leader>D'
let g:pymode_rope_completion = 1
let g:pymode_rope_completion_on_dot = 1
let g:pymode_rope_completion_bind = '<C-Space>'
let g:pymode_rope_autoimport = 1
let g:pymode_rope_goto_definition_bind = '<Leader>g'
let g:pymode_rope_lookup_project = 0

" Better navigation through omnicomplete option list
" Se http://stackoverflow.com/questions/2170023/how-to-map-keys-for-.....
set completeopt=longest,menuone
function! OmniPopup(action)
   if pumvisible()
      if a:action == 'j'
         return "\<C-N>"
      elseif a:action == 'k'
         return "\<C-P>"
      ndif
endfunction
