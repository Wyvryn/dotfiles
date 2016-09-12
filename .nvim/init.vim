" set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize

call plug#begin('~/.vim/plugged')
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'
Plug 'junegunn/seoul256.vim'
Plug 'majutsushi/tagbar'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ntpeters/vim-airline-colornum'
Plug 'easymotion/vim-easymotion'
Plug 'bronson/vim-trailing-whitespace'
Plug 'unblevable/quick-scope'
Plug 'vim-utils/vim-troll-stopper'
Plug 'vimwiki/vimwiki'
Plug 'Yggdroot/indentLine'
Plug 'nvie/vim-flake8'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'fisadev/vim-isort'
Plug 'kien/rainbow_parentheses.vim'

"Plug 'xolox/vim-easytags'
"Plug 'xolox/vim-misc'
"Plug 'tmhedberg/SimpylFold'
"Plug 'scrooloose/syntastic'
"Plug 'jiangmiao/auto-pairs'
"Plug 'scrooloose/nerdtree'
"Plug 'MattesGroeger/vim-bookmarks'
"Plug 'Valloric/YouCompleteMe', {'do': './install.py'}
"Plug 'vasconcelloslf/vim-interestingwords'
"Plug 'jceb/vim-orgmode'
"Plug 'tpope/vim-speeddating'
"Plug 'osyo-manga/vim-over'
"Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

filetype plugin indent on    " required

syntax on
let g:python_host_prog='/home/mike/virtualenvs/nvim27/bin/python'
let g:python3_host_prog='/home/mike/virtualenvs/nvim3/bin/python'
set shell=/bin/bash
colo seoul256

hi Normal ctermbg=none
set history=1000
set undolevels=700
set nobackup
set nowritebackup
set noswapfile
set showcmd
set backspace=indent,eol,start
set gcr=a:blinkon0
set showmode
set autoread
set hidden
set encoding=utf8
set cursorline
set tabstop=4
set softtabstop=4
set expandtab
set laststatus=2
set shiftwidth=4
set ignorecase
set smartcase
set nowrap
set smartindent
set splitright
set timeoutlen=200
set nu
set nocursorcolumn
set norelativenumber
set undodir=~/.vim/undo
set undofile
set pastetoggle=<F2>
set clipboard=unnamedplus
set guifont=Sauce\ Code\ Powerline\ Plus\ Nerd\ File\ Types\ 9

syntax sync minlines=256

autocmd BufEnter * set mouse=
autocmd FileType python execute "set cc=" . join(range(91,335), ',')

let mapleader = "\<Space>"
nmap <Leader><Leader> V

nmap <tab> gt
nmap <s-tab> gT
nnoremap ; :
tnoremap <Esc> <C-\><C-n>
ino <C-C> <Esc>

noremap <S-l> 10l
noremap <S-k> 10k
noremap <S-j> 10j
noremap <S-h> 10h

autocmd BufWritePre * :FixWhitespace

map <f12> :!ctags -R --fields=+l --languages=python --python-kinds=-iv -f ./tags .<cr>

map <c-t> :tabnew<CR>

let g:vim_isort_map = '<C-i>'

inoremap # x<BS>#

let g:indentLine_faster = 1

"Airline
let g:bufferline_echo = 0
let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'

"Easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap s <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Autopep8
au FileType python setlocal formatprg=autopep8\ --aggressive\ --aggressive\ --max-line-length\ 120\ --ignore\ E712\ -

let g:autopep8_ignore="E501"

let g:tagbar_left = 0
nmap <C-b> :TagbarToggle<CR>

let showtabline=2

"  Rainbow Parenthesis
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"  QuickScope
function! Quick_scope_selective(movement)
    let needs_disabling = 0
    if !g:qs_enable
        QuickScopeToggle
        redraw
        let needs_disabling = 1
    endif

    let letter = nr2char(getchar())

    if needs_disabling
        QuickScopeToggle
    endif

    return a:movement . letter
endfunction

let g:qs_enable = 0

nnoremap <expr> <silent> f Quick_scope_selective('f')
nnoremap <expr> <silent> F Quick_scope_selective('F')
nnoremap <expr> <silent> t Quick_scope_selective('t')
nnoremap <expr> <silent> T Quick_scope_selective('T')
vnoremap <expr> <silent> f Quick_scope_selective('f')
vnoremap <expr> <silent> F Quick_scope_selective('F')
vnoremap <expr> <silent> t Quick_scope_selective('t')
vnoremap <expr> <silent> T Quick_scope_selective('T')

" Deoplete
let g:deoplete#enable_at_startup = 1

let g:flake8_show_in_file=1
let g:flake8_show_in_gutter=1

let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#show_call_signatures = 0

function s:svnBlame()
   let line = line(".")
   setlocal nowrap
   " create a new window at the left-hand side
   aboveleft 20vnew
   " blame, ignoring white space changes
   %!svn blame -g -x -w "#"
   setlocal nomodified readonly buftype=nofile nowrap winwidth=1
   setlocal nonumber
   if has('&relativenumber') | setlocal norelativenumber | endif
   " return to original line
   exec "normal " . line . "G"
   " synchronize scrolling, and return to original window
   setlocal scrollbind
   wincmd p
   setlocal scrollbind
   syncbind
endfunction
map gb :call <SID>svnBlame()<CR>
command Blame call s:svnBlame()

" go to defn of tag under the cursor
fun! MatchCaseTag()
    let ic = &ic
    set noic
    try
        exe 'tjump ' . expand('<cword>')
    finally
       let &ic = ic
    endtry
endfun
nnoremap <silent> <c-]> :call MatchCaseTag()<CR>
