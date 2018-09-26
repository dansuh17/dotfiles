""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom RTP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" this will make you NOT use ~/.vim but use the alternative path
let &rtp = substitute(&rtp, $HOME."/\.vim", "$HOME/\.dansuh/\.vim", "g")

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Profiling
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Run the following commands in order to check what's making your vim slow.
" :profile start profile.log
" :profile func *
" :profile file *
"" At this point do slow actions
" :profile pause

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-plug Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :PlugList, :PlugInstall, :PlugClean, :PlugSearch
set nocompatible
filetype off

call plug#begin()
" NOTE that some of these plugins will not properly work if
" the editor is not macvim.
" Use 'brew install macvim --with-override-system-vim' command
" to properly install macvim on OSX.
Plug 'junegunn/fzf'  " fuzzy finder
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'  " surround functions
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ntpeters/vim-better-whitespace'  " whitespace helper
Plug 'mileszs/ack.vim'  " use silver searcher
Plug 'w0rp/ale'  " asynchronous linter - vim8 required - use either syntastic or ale not both
Plug 'itchyny/lightline.vim'  " status line plugin
Plug 'mgee/lightline-bufferline'  " show buffers to tabline
Plug 'maximbaz/lightline-ale'  " lightline + ALE
Plug 'ludovicchabant/vim-gutentags'  " automatic tags file generator

" language syntax highlighting
Plug 'neovimhaskell/haskell-vim'  " better syntax highlighting for haskell
Plug 'deNsuh/python-syntax'  " better python syntax highlighting

" colorschemes - uncomment to use
Plug 'romainl/Apprentice'  " apprentice
" Plug 'altercation/vim-colors-solarized'  " solarized
" Plug 'kaicataldo/material.vim'  " material
" Plug 'nightsense/vimspectr'
" Plug 'phanviet/vim-monokai-pro'  " monokai_pro
" Plug 'jnurmine/Zenburn'  " zenburn
" Plug 'dracula/vim', { 'as': 'dracula' }  " dracula
" Plug 'arcticicestudio/nord-vim'  " nord

" All of your plugins must be added before the following line
call plug#end()
filetype plugin on
filetype indent on
syntax enable

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" formattings and editor functionalities
set number  " line number
" `relativenumber` disabled due to slow scrolling (multiple regex function execution happening)
" set relativenumber
set autoindent
set cindent
set tabstop=2  " tab = 2 spaces
set expandtab  " expand tab into spaces
set shiftwidth=2
set shiftround  " round indents to multiple of shiftwidth
set ruler  " indicate current position of cursor
set showcmd	 " show incomplete commands
set wildmenu  " allow autocompletion with <tab>
set encoding=utf-8
set backspace=2  " make backspace work normally
set showmatch  " show matching brackets when text indicator is over them
set mat=2  " 0.2sec to blink on matching brackets
set laststatus=2  " show status line at all times
set scrolloff=5
set title  " change terminal's title
set mouse=a  " enable mouse in all modes
set noshowmode  " lightline shows the mode for me instead
set showtabline=2  " always show tabline
set completeopt=menu,menuone,preview,noselect,noinsert

" no annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=  " visual bell
silent! set belloff=all  " silent because it might not work for some versions

" searching
set smartcase
set hlsearch  " highlight search (:noh<cr> to disable)
set incsearch  " immediately highlight seraches

" advanced
set autowrite  " auto write when going off to other files
set autoread  " auto read in when modified outside
set nobackup
set noswapfile  " no .swp files!
" hides buffers instead of closing - doesn't force you to apply the changes
set hidden
set lazyredraw  " buffers screen updates for fast scrolling
" the below two options will show certain characters (tabs, trailing
" spaces, extends, nbsp) with provided characters
set list
set listchars=tab:>-
set ttyfast  " used for fast redrawing (*removed feature in NeoVim)

" misc
set history=700  " remember up to n histories
set timeoutlen=500  " timeout length on mappings and key codes
" marks remembered for last 100 files, 3000 line limit to yank,
" registers with more than 100kB text are skipped
set viminfo='100,<30000,s100

" Return to last edit position when opening files (You want this!)
" WOWW
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" locality and security
set exrc  " if found, use local .vimrc
set secure  " restrict some commands in non-default .vimrc

set nopaste  " default is nopaste
set pastetoggle=<F10>  " map paste toggle key
" this is set because 'paste' disables all mappings

" disable sound on errors on MacVim
if has("gui_macvim")
  autocmd GUIEnter * set vb t_vb=
endif

" if ag is available, use it over :grep
" use :copen, :cn, :cp, :cclose, :cr<num> to navigate / open quickfix
" also find :cdo, :argdo, :bufdo for executions across files
" NOTE: navigation using :cn or :cp will not work
" if ag-backed grep is applied on a single file '%' (current file),
" because ag will not show the file name.
" use :vimgrep or simply search using '/'
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --column
  set grepformat=%f:%l:%c%m
endif

" collect open buffers
function! BuffersList()
  let all = range(0, bufnr('$'))
  let res = []
  for b in all
    if buflisted(b)
      call add(res, bufname(b))
    endif
  endfor
  return res
endfunction

" [!] prevents vimgrep from moving cursor to the first matching result
function! GrepBuffers(expression)
  exec 'vimgrep!/'.a:expression.'/ '.join(BuffersList())
endfunction

" bind K to grep word under cursor for all open buffers
nnoremap K :call GrepBuffers("<C-R><C-W>")<CR>

" Delete trailing white space on save!!!
fun! CleanExtraSpaces()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  silent! %s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfun

if has("autocmd")
  autocmd BufWritePre *.c,*.cc,*.js,*.py,*.sh,*.json,*.cpp,*.go,*.h,*.hpp,*.hs,.vimrc,.zshrc,*.java,*.scala :call CleanExtraSpaces()
endif

" dependencies and paths
set tags=./tags,tags,../tags,../../tags
" set path variable for searching include files
set path=.,..,/usr/local/include,/Library/Frameworks
" search sub-directories recursively from current working directory when finding files
set path+=**
" ignore when searching files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/\.git/*,*DS_Store*,*/node_modules/*  " OSX/Linux

" colorscheme - very sensitive stuff :(
set background=dark
" try term=screen-256color if this doesn't work for you
" set term=xterm-256color
silent! colorscheme apprentice
" silent! set termguicolors  " should be uncommented if colorscheme doesn't work properly

" TIPS
" <using help>
" for vim-script keywords:
" :h 'expandtab'
"
" <show end of line>
" :set list (:set nolist to disable)
"
" <inserting digraphs>
" :dig or i_CTRL-k
"
" view contents in macro
" :put <register>
"
" see histories
" command line history
" :his c
" command line history window
" q:
" search history
" :his s
"
" set the previous context mark
" m` or m'
" mark position at register a
" :ma a
" move position to register a
" `a
" go to previous context mark
" '' or ``
"
" finding file (vim default)
" :find .vimrc
"
" view the full path of file
" :echo expand("%:p")
" only the name
" :echo expand("%")
"
" opening quickfix
" :cc
"
" opening location list
" :lopen
"
" displays the last line number
" :=
"
" execute normal command
" :norm {commands}
"
" repeat the last :!{cmd} (shell command)
" :!!
"
" auto reindent entire file
" g=GG
" (see ':help =' for more)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" goes down one 'visual' line
nmap j gj
" goes up one 'visual' line
nmap k gk

" function key mappings
nmap <F2> :bp<CR>
nmap <F3> :bn<CR>
nmap <F4> :make!<CR>
nmap <F7> :nohl<CR>
nmap <F8> :!ctags -R .<CR>
" or use a command
command! MakeTags !ctags -R .
" use ^] to jump immediately, use g^] for ambiguous tags

" leader mapping
let mapleader = "-"
let g:mapleader = "-"

" map Ctrl-c to behave the same as <ESC> (<C-c> will not trigger InsertLeave event)
" <Esc> is pressed twice since it will wait for 'timeoutlen' millisecs
" in case there is a mapping with <Esc>.
inoremap <C-c> <Esc><Esc>

" keymap that opens .vimrc in a split window
" mnemonic: 'e'dit my 'v'imrc file
nnoremap <leader>ev :vs $MYVIMRC<cr>
" 's'ourcing my 'v'imrc file
nnoremap <leader>sv :source $MYVIMRC<cr>

" commenting out
autocmd FileType javascript nnoremap <C-/> I//<C-c>
autocmd FileType vim nnoremap <leader>c I"<esc>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" snippets!!
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" invoke read command, (with no extra line '-1') and move the cursor
" to wanted position
nnoremap ,html :-1read $HOME/.vim/skel/html<CR>3jwf>a
" python main
nnoremap ,pyma :-1read $HOME/.vim/skel/pymain<CR>jA
" python docstring
nnoremap ,pydoc :-1read $HOME/.vim/skel/pydoc<CR>j


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerdtree Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeIgnore=['\.pyc$', '\~$']  " ignore these files in NERDTree


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" better whitespace option
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight ExtraWhitespace ctermbg=0xFF0000


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ack.vim options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use ag instead of ack if available
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" uncomment below if you don't want to jump to first result instantly
" cnoreabbrev Ack Ack!
" nnoremap <leader>a :Ack!<Space>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ale settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" only run the lint during text change in normal mode
let g:ale_lint_on_text_changed = 'normal'
" instead of running the linter always in insert mode,
" only run the linter when leaving the insert - InsertLeave event
let g:ale_lint_on_insert_leave = 1
" 0.5s delay to linter to run after text change
let g:ale_lint_delay = 500
" Enable completion
let g:ale_completion_enabled = 1

" specific linters
" python : pip install flake8 pylint pyls
" haskell : stack install hlint hdevtools hfmt
let g:ale_linters = {
      \ 'haskell': ['hlint', 'hdevtools', 'hfmt'],
      \ 'python': ['flake8', 'pyls'],
      \}

" ignore annoying errors (column length limit)
let g:ale_python_flake8_options = '--ignore=E501,E266'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map to control-p
nnoremap <C-p> :Files<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightline settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {}
" lightline + ale
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \  'buffers': 'lightline#bufferline#buffers',
      \}
let g:lightline.component_type = {
      \  'linter_checking': 'left',
      \  'linter_warnings': 'warning',
      \  'linter_errors': 'error',
      \  'linter_ok': 'left',
      \  'buffers': 'tabsel',
      \}
let g:lightline.component = {
      \ 'charvaluehex': '0x%B',
      \ }
let g:lightline.active = {
      \ 'right': [['lineinfo'],
      \           ['percent'],
      \           [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
      \           ['fileformat', 'fileencoding', 'filetype', 'charvaluehex']],
      \ }
let g:lightline.tabline = {'left': [['buffers']], 'right': [['close']]}
let g:lightline#bufferline#show_number = 1  " show buffer number as in :ls


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gutentags settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:gutentags_ctags_executable = '/usr/local/bin/ctags'  " [OSX] use brew-installed ctags
set statusline+=%{gutentags#statusline()}
augroup MyGutentagsStatusLineRefresher
  autocmd!
  autocmd User GutentagsUpdating call lightline#update()
  autocmd User GutentagsUpdated call lightline#update()
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" haskell-vim settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:haskell_enable_quantification = 1  " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1  " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1  " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1  " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1  " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1  " to enable highlighting of backpack keywords


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python-vim settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enable everything except space highlights
let python_self_cls_highlight = 1
