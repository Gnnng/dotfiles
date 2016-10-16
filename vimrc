let mapleader = "\<Space>"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'dracula/vim'
Plugin 'w0ng/vim-hybrid'
Plugin 'jacoborus/tender'
Plugin 'jdkanani/vim-material-theme'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
    set laststatus=2 " required by vim-airline
    let g:airline_theme = 'tender'
    let g:airline_left_sep = ''
    let g:airline_right_sep = ''
    let g:airline_section_z = ''
Plugin 'scrooloose/nerdtree'
    map <leader>n :NERDTreeToggle<CR>:NERDTreeMirror<CR>
Plugin 'majutsushi/tagbar'
    map <leader>b :TagbarToggle<CR>
Plugin 'kien/ctrlp.vim'
    nnoremap <leader>o :CtrlP<CR>
Plugin 'scrooloose/nerdcommenter'
    let g:NERDSpaceDelims=1
Plugin 'Valloric/YouCompleteMe'
    nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
    nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
    nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
    map <F9> :YcmCompleter FixIt<CR>
Plugin 'rdnetto/YCM-Generator'
Plugin 'chiel92/vim-autoformat'
    noremap <leader>f :Autoformat<CR> :w<CR>
Plugin 'tpope/vim-sleuth'
Plugin 'terryma/vim-multiple-cursors'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"

" Basic settings

" when backspace key works
set backspace=eol,start,indent
" enable syntax highlighting
syntax on
" move across lines
set whichwrap+=<,>,h,l
" about search
set ignorecase smartcase hlsearch incsearch
" set column ruler
set colorcolumn=80
" highlight the editing line
set cursorline
" show what you are typing as a command
set showcmd
" fast navigation between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" restore last cursor position in existing file
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" remove any trailing whitespace
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
" about indent (deprecated due to the plugin sleuth)
" set expandtab smarttab shiftwidth=4 softtabstop=4 tabstop=4
" color
if (has("termguicolors"))
    set termguicolors
endif

color material-theme
set background=dark
" mapping
nnoremap <Enter> :
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>s :source ~/.vimrc<CR>
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>1 1gt<CR>
nnoremap <leader>2 2gt<CR>
nnoremap <leader>3 3gt<CR>
nnoremap <leader>4 4gt<CR>
nnoremap <leader>5 5gr<CR>
" nnoremap <leader>j :tabprevious<CR>
" nnoremap <leader>k :tabnext<CR>
map q: :q
set pastetoggle=<F10>
