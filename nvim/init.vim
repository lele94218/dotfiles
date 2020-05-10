filetype off
filetype plugin on
let mapleader=";"
set colorcolumn=100
set cursorcolumn
" set cursorline
set hidden
set ignorecase
set nocompatible
set nu
set ruler
set wildmenu

set clipboard=unnamedplus

" Auto detect change and load
set autoread

" Prevent search and highlight jump
nnoremap * *``

" turn relative line numbers on
set relativenumber
set rnu
filetype indent on

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Mouse
set mouse=n

" Tab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Window
set splitright
set splitbelow

" Tabline
set showtabline=2

" Status bar
set laststatus=2

" Spell check
" set spell
nmap <C-s> :set spell!<CR>

" Mapping keys
nmap <Leader>Q :qa!<CR>
nmap <Leader>WQ :wa<CR>:q<CR>
nmap <Leader>p "+p
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
vnoremap <Leader>y "+y
vnoremap <Leader>p "+p

" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :set hls!<CR>
vnoremap <C-n> :set hls!<CR>
inoremap <C-n> :set hls!<CR>

" easier moving of code blocks
" Try to go into visual mode (v), then select several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set so=10
set sidescroll=10
set whichwrap=b,s

" Make search case insensitive
set hlsearch
set incsearch
"" set ignorecase
set smartcase

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Switch between c++ header/source
nmap <Leader>s :call SwitchSourceHeader()<CR>


" Plugin
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/fzf.vim'
Plugin 'google/vim-glaive'
Plugin 'google/vim-searchindex'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'vim-python/python-syntax'
Plugin 'junegunn/vim-peekaboo'
Plugin 'Glench/Vim-Jinja2-Syntax'
call vundle#end()            " required
call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar /path/to/google-java-format-VERSION-all-deps.jar"
Glaive codefmt clang_format_style="{BasedOnStyle: Google, IndentWidth: 2, ColumnLimit: 100, BinPackArguments: false, BinPackParameters: false, DerivePointerAlignment: false, PointerAlignment: Left}"
Glaive codefmt autopep8_executable="null"
" Glaive codefmt yapf_executable="null"
filetype plugin indent on    " required

" Colorscheme
" colorscheme gruvbox
" colorscheme lightning
colorscheme delek

" Peekaboo
let g:peekaboo_window="bo 30new"

" NERDTree
map <C-t> :NERDTreeToggle<CR>
map <C-p> :NERDTreeFind<CR>

" vim-codefmt
vnoremap <Leader>f :FormatLines<CR>

" fzf.vim
map <Leader>t :Files<CR>
map <Leader>h :History:<CR>
map <Leader>j :Buffers<CR>
map <Leader>a :Ag<Space>
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--color-path="0;33" --ignore some-bin --literal', <bang>0)

" ack.vim
let g:ackpreview = 1
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" cpp highlight syntax

" Highlighting of class scope is disabled by default. To enable set
let g:cpp_class_scope_highlight = 1

" Highlighting of member variables is disabled by default. To enable set
let g:cpp_member_variable_highlight = 1

" Highlighting of class names in declarations is disabled by default. To enable set
let g:cpp_class_decl_highlight = 1

" There are two ways to highlight template functions. Either
let g:cpp_experimental_simple_template_highlight = 1

" which works in most cases, but can be a little slow on large files. Alternatively set
" let g:cpp_experimental_template_highlight = 1

" which is a faster implementation but has some corner cases where it doesn't work.
" Note: C++ template syntax is notoriously difficult to parse, so don't expect this feature to be perfect.
" Highlighting of library concepts is enabled by
let g:cpp_concepts_highlight = 1

" This will highlight the keywords concept and requires as well as all named requirements (like DefaultConstructible) in the standard library.
" Highlighting of user defined functions can be disabled by

let g:cpp_no_function_highlight = 1

" Python hightlight syntax
let g:python_highlight_all = 1

" Custom functions
function! SwitchSourceHeader()
  if (expand ("%:e") == "cc")
    find %:t:r.h
  else
    find %:t:r.cc
  endif
endfunction
