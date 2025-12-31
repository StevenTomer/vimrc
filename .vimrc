set smartindent
set tabstop=4
set shiftwidth=4
set ruler
set nohls
set number
set expandtab
set ignorecase
set incsearch
set wrapscan
set mouse=a
set hidden
set nofoldenable
syntax on

" ---------- PLUG ---------------
" Install and load the Plug plugin (auto-fetches various plugins)
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
  "Plug 'tpope/vim-sensible'
  Plug 'preservim/nerdtree'                  " Provides the tree on the side, opened by F9
  Plug 'vim-scripts/kwbdi.vim'               " Allows you to close a buffer witout closing the window, done by C-w, then !
  Plug 'fholgado/minibufexpl.vim'            " Shows the opened buffers across the top of the window
  Plug 'StevenTomer/vim-steve-theme'         " Loads a dark theme
  Plug 'StevenTomer/vim-smart-shift'         " Allows you to move lines up and down with C-j and C-k, and text left and right with C-h and C-l
  Plug 'vim-syntastic/syntastic'             " Syntax highlighting
  Plug 'tpope/vim-surround'                  " Allows you to change, remove, or add surrounding quotes, brackets, and tags
  Plug 'tpope/vim-fugitive'                  " Git highlighting
  Plug 'airblade/vim-gitgutter'              " Adds a single character git diff in the sign column.  Toggle with :GitGutterToggle 
  Plug 'scrooloose/nerdcommenter'            " Commenting - cc comments current line, c{space} toggles comment, cu uncomment
  Plug 'vim-airline/vim-airline'             " Upgrades the vim status bar
  Plug 'nathanaelkane/vim-indent-guides'     " Shows indent levels
call plug#end()
" ---------- PLUG ---------------

" ---------- COLORS ---------------
set t_Co=256
try
    colorscheme steve_theme
catch /^Vim\%((\a\+)\)\=:E185/
    " Optional: Load a default theme if steve_theme is missing
    colorscheme default 
endtry
" ---------- COLORS ---------------

" ---------- COPY/PASTE FROM CLIPBOARD ---------------
noremap \c "+y
noremap \x "+x
noremap \v "+p
noremap \V "+P
" ---------- PASTE FROM CLIPBOARD ---------------

" -- Quick Alt-j/k between buffers
nnoremap <M-j> :bp<cr>
nnoremap <M-k> :bn<cr>
inoremap <M-j> <ESC>:bp<cr>
inoremap <M-k> <ESC>:bn<cr>
" -- 

" -- Quick Resizing of windows
map <M-<> <C-W><
map <M->> <C-W>>
" -- 

" -- Easy close buffer using Kwbd
nmap <C-W>! <Plug>Kwbd
" -- 

" -- Remove GUI options and toolbar
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
" -- 

" Define the toggle function
function! ToggleUI()
  if &guioptions =~# 'T'
    set guioptions-=T
    set guioptions-=m
  else
    set guioptions+=T
    set guioptions+=m
  endif
endfunction
" -- 

" Map F3 to call the function
nnoremap <silent> <F3> :call ToggleUI()<CR>
" -- 

let g:NERDTreeIgnore=['.pyc$', '^target$[[dir]]', '^.git$[[dir]]']
let g:miniBufExplMapCTabSwitchWindows = 1
let g:miniBufExplModSelTarget = 1


autocmd VimEnter * IndentGuidesEnable
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#000000 ctermbg=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#070707 ctermbg=232

nnoremap <F2> :set nonumber!<cr>:set foldcolumn=0<cr>
noremap <F9> :NERDTreeToggle<cr>
