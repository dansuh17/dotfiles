""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :PluginList, :PluginInstall, :PluginClean, :PluginSearch
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" algernatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" NOTE that some of these plugins will not properly work if
" the editor is not macvim.
" Use 'brew install macvim --with-override-system-vim' command
" to properly install macvim on OSX.
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim' 		       " required
Plugin 'Valloric/YouCompleteMe'
Plugin 'chriskempson/base16-vim'         " base-16 colorthemes
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'  " themes for airline
Plugin 'edkolev/tmuxline.vim'						 " apply airline-synced theme to tmux
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'							 " snippets for ultisnips
Plugin 'kien/ctrlp.vim'									 " fuzzy finder
Plugin 'fugitive.vim'
Plugin 'The-NERD-tree'

" All of your plugins must be added before the following line
call vundle#end()
filetype plugin indent on
syntax enable

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" formattings and editor functionalities
set number				      " line number
set relativenumber
set autoindent
set cindent
set tabstop=2           " tap = 2 spaces
set expandtab           " expand tab into spaces
set shiftwidth=2
set ruler					      " indicate current position of cursor
set showcmd				      " show incomplete commands
set wildmenu            " allow autocompletion with <tab>
set encoding=utf-8
set term=xterm-256color	" enables airline within tmux

" searching
set smartcase
set hlsearch

" advanced
set autowrite			      " auto write when going off to other files
set autoread			      " auto read in when modified outside

" locality and security
set exrc					      " if found, use local .vimrc
set secure				      " restrict some commands in non-default .vimrc

set nopaste				      " default is nopaste
set pastetoggle=<F10>		" map paste toggle key
" this is set because 'paste' disables all mappings

" dependencies and paths
set tags=./tags,tags,../tags,../../tags
" set path variable for searching include files
set path=.,..,/usr/local/include,/Library/Frameworks
cs add ../cscope.out

" note that colortheme is selected within iTerm2!
" no specific colortheme applied in .vimrc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F2> :bp<CR>
nmap <F3> :bn<CR>
nmap <F4> :make!<CR>
nmap <F7> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YCM has to be compiled before using!
" use --clang-compeleter option
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion=['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion=['<S-TAB>', '<Up>']
let g:ycm_key_detailed_diagnostics='<leader>d'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_confirm_extra_conf = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<c-x>" 		" 'x' for expand
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Enable ycm support
let g:airline#extensions#ycm#enabled = 1
" set error count prefix >
let g:airline#extensions#ycm#error_symbol = 'E:'
" set warning count prefix >
let g:airline#extensions#ycm#warning_symbol = 'W:'
" make airline appear all the time
set laststatus=2
" enable tmuxline integration
" also, powerline/fonts is installed for status bar's
" non-ascii character support
let g:airline#extensions#tmuxline#enabled = 1
" theme: goes well with base16_ocean
let g:airline_theme='base16_monokai'
" compatible with fugitive
let g:airline#extension#branch#enabled = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" base 16 settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" without this, the colors will be really no-jem
let base16colorspace = 256

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tmuxline settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enable all display options
let g:tmuxline_preset = 'full'
