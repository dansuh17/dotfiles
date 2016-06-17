""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" formatting
set nu
set autoindent
set cindent
set ts=2                " tab width
set shiftwidth=2        " width of auto indenting

" set format options, works along with 'textwidth'
set formatoptions="r,c,o"
set textwidth=0         " do not use text wrapping
set colorcolumn=80      " mark 80th column
set expandtab           " expand tab into spaces
set scrolloff=3         " keep 3 lines when scrolling

" searching
" type :nohl to disable highligh search matches
set smartcase           " case insensitive if no upper case
set hlsearch            " highlight search
set incsearch           " preview search

set autowrite           " auto write when going off to other files
set autoread            " auto read in when modified outside
set ruler               " indicate current position of cursor
set wildmenu            " wildmenu tab for :h
set laststatus=2        " make airline appear all times

set sc                  " display incomplete commands 'showcmd'
set complete=".,w,b,t"  " ins-completion options

set exrc                " if found, use local .vimrc
set secure              " restrict some commands in non-default .vimrc

" set makeprg=make\ -C\ ../build\ -j9   " allows vim to use :make
" :set paste  " this removes side-effects from copy-and-pasting
" :set nopaste " undo paste

" set path variable for searching include files
" Directories are comma-separated
set path=.,..,/usr/local/include,/usr/include,/Library/Frameworks
" file paths fore possible tags files
set tags=./tags,tags,../tags,../../tags
cs add ../cscope.out

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F7> :NERDTreeToggle<CR>
nmap <F4> :make!<CR>
"nmap <F5> :!./my_program<CR> "This way you can launch a project
imap <Tab> <C-P>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" file located in ~/.vim/colors
" view :h 'rtp' for details
syntax on
colorscheme onedark

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible		" required
filetype plugin indent off
runtime macros/matchit.vim
syntax off			" required

 "set runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

 "start vundle environment
call vundle#begin()
 "alternatively, pass a path where Vundle should install plugins
 "call vundle#begin('~/some/path/here')

 "list of plugins
 "let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'surround.vim'
Plugin 'ctags.vim'
Plugin 'The-NERD-tree'
Plugin 'vim-airline/vim-airline'
Plugin 'ctrlp.vim'
" Plugin 'Syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'joshdick/onedark.vim'
Plugin 'ggreer/the_silver_searcher'
Plugin 'SirVer/ultisnips'   "Snippet engine
Plugin 'honza/vim-snippets' "Snippets themselves

 "add plugins before this
call vundle#end()

 "now (after vundle finished) it is safe to turn filetype plugins on
filetype plugin indent on
syntax on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename in list of buffers
let g:airline#extensions#tabline#fnamemod = ':t'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show hidden files
let g:ctrlp_show_hidden = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnipts settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<F3>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" You Complete Me settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf ='~/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_confirm_extra_conf = 0
