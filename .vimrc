set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'jiangmiao/auto-pairs'
Plugin 'lilydjwg/colorizer'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/seoul256.vim'
"Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
"Plugin 'joshdick/onedark.vim'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'bling/vim-airline'
Plugin 'ntpeters/vim-airline-colornum'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'easymotion/vim-easymotion'
Plugin 'xolox/vim-misc'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'xolox/vim-notes'
" Plugin 'garbas/vim-snipmate'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'Valloric/YouCompleteMe'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'vasconcelloslf/vim-interestingwords'
Plugin 'jceb/vim-orgmode'
Plugin 'tpope/vim-speeddating'
Plugin 'exu/pgsql.vim'
Plugin 'unblevable/quick-scope'
Plugin 'ryanoasis/vim-webdevicons'
Plugin 'lervag/vimtex'
Plugin 'osyo-manga/vim-over'
Plugin 'vim-utils/vim-troll-stopper'
"Plugin 'tmhedberg/SimpylFold'
Plugin 'vimwiki/vimwiki'
Plugin 'wellle/targets.vim'


call vundle#end()            " required
filetype plugin indent on    " required

syntax on

set shell=/bin/bash
colo seoul256
"colo dracula
"colorscheme onedark
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

autocmd FileType python execute "set cc=" . join(range(91,335), ',')

set undodir=~/.vim/undo
set undofile

set pastetoggle=<F2>
set clipboard=unnamedplus

set guifont=Sauce\ Code\ Powerline\ Plus\ Nerd\ File\ Types\ 9

set cursorline
set tabstop=4
set softtabstop=4
set expandtab
set laststatus=2
set shiftwidth=4
set t_Co=256
set ignorecase
set smartcase
set nowrap
set smartindent
set splitright
set nu

ino <C-C> <Esc>

nmap <S-Up> 10<Up>
nmap <S-Down> 10<Down>
nmap <S-Left> 10<Left>
nmap <S-Right> 10<Right>

noremap <S-l> 10l
noremap <S-k> 10k
noremap <S-j> 10j
noremap <S-h> 10h
let mapleader = "\<Space>"
nmap <Leader><Leader> V

"NERDTree
map <C-n> :NERDTreeTabsToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"Airline
let g:bufferline_echo = 0
set timeoutlen=200
let g:airline_powerline_fonts = 1
" let g:airline_theme='powerlineish'
let g:airline_theme='powerlineish'

"Jedi
"let g:jedi#use_splits_not_buffers = "right"
"autocmd FileType python setlocal completeopt-=preview


"CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc
map <c-t> :tabnew<CR><c-p>
map <c-o> :vnew<CR><c-t>

"SnipMate
"let g:snipMate = {}
"imap <C-\> <Plug>snipMateNextOrTrigger
"smap <C-\> <Plug>snipMateNextOrTrigger

"Easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

"  Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_xml_checkers=['']
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
let g:syntastic_python_flake8_args='--ignore=E501'
nnoremap <C-e> :SyntasticCheck<CR>


au FileType python setlocal formatprg=autopep8\ --aggressive\ --aggressive\ --max-line-length\ 90\ --ignore\ E712\ -

let g:autopep8_ignore="E501"

let g:tagbar_left = 0
nmap <C-b> :TagbarToggle<CR>

let showtabline=2

"  Bad Habits
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"  Bookmarks
let g:bookmark_no_default_key_mappings = 1
function! BookmarkMapKeys()
    nmap mm :BookmarkToggle<CR>
    nmap mi :BookmarkAnnotate<CR>
    nmap mn :BookmarkNext<CR>
    nmap mp :BookmarkPrev<CR>
    nmap ma :BookmarkShowAll<CR>
    nmap mc :BookmarkClear<CR>
    nmap mx :BookmarkClearAll<CR>
endfunction
function! BookmarkUnmapKeys()
    unmap mm
    unmap mi
    unmap mn
    unmap mp
    unmap ma
    unmap mc
    unmap mx
endfunction
autocmd BufEnter * :call BookmarkMapKeys()
autocmd BufEnter NERD_tree_* :call BookmarkUnmapKeys()

"  You Complete Me
let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_key_list_select_completion=[]
" let g:ycm_key_list_previous_completion=[]

"  Rainbow Parenthesis
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

"  SQL
let g:sql_type_default = 'pgsql'

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

" SimpylFold
" let g:SimpylFold_docstring_preview = 1
" autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
" autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
"
