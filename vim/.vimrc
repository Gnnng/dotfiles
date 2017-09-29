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
    let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
Plugin 'scrooloose/nerdcommenter'
    let g:NERDSpaceDelims=1
" Plugin 'Valloric/YouCompleteMe'
    " nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
    " nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
    " nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
    " map <F9> :YcmCompleter FixIt<CR>
    " let g:ycm_confirm_extra_conf = 0
" Plugin 'Yggdroot/indentLine'
Plugin 'rdnetto/YCM-Generator'
" Plugin 'chiel92/vim-autoformat'
    " noremap <leader>f :Autoformat<CR> :w<CR>
Plugin 'tpope/vim-sleuth'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ntpeters/vim-better-whitespace'
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
" autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
" about indent
set expandtab smarttab shiftwidth=4 softtabstop=4 tabstop=4
" color
color dracula
set background=dark
set encoding=utf-8
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>s :source ~/.vimrc<CR>
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>1 1gt<CR>
nnoremap <leader>2 2gt<CR>
nnoremap <leader>3 3gt<CR>
nnoremap <leader>4 4gt<CR>
nnoremap <leader>5 5gt<CR>
nnoremap <leader>f :py3file ~/.vim/clang-format.py<CR>
" nnoremap <leader>j :tabprevious<CR>
" nnoremap <leader>k :tabnext<CR>
nnoremap <leader><leader>w :w !sudo tee %<CR>
map q: :q
set pastetoggle=<F10>
" add cscope
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
    "		0 or s: Find this C symbol
    "		1 or g: Find this definition
    "		2 or d: Find functions called by this function
    "		3 or c: Find functions calling this function
    "		4 or t: Find this text string
    "		6 or e: Find this egrep pattern
    "		7 or f: Find this file
    "		8 or i: Find files #including this file
    "		9 or a: Find places where this symbol is assigned a value
    nnoremap <leader>c0 :cs find 0 <C-R>=expand("<cword>")<CR><CR>
    nnoremap <leader>c1 :cs find 1 <C-R>=expand("<cword>")<CR><CR>
    nnoremap <leader>c2 :cs find 2 <C-R>=expand("<cword>")<CR><CR>
    nnoremap <leader>c3 :cs find 3 <C-R>=expand("<cword>")<CR><CR>
    nnoremap <leader>c4 :cs find 4 <C-R>=expand("<cword>")<CR><CR>
    nnoremap <leader>c6 :cs find 6 <C-R>=expand("<cword>")<CR><CR>
    nnoremap <leader>c7 :cs find 7 <C-R>=expand("<cword>")<CR><CR>
    nnoremap <leader>c8 :cs find 8 <C-R>=expand("<cword>")<CR><CR>
    nnoremap <leader>c9 :cs find 9 <C-R>=expand("<cword>")<CR><CR>
endif
