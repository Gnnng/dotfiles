let mapleader = "\<Space>"
set nocompatible              " be iMproved, required
filetype off                  " required

" vim-plug install directory
call plug#begin('~/.vim/plugged')

" themes
Plug 'rakr/vim-one'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'flazz/vim-colorschemes'
Plug 'dracula/vim'
Plug 'w0ng/vim-hybrid'
Plug 'jacoborus/tender'
Plug 'jdkanani/vim-material-theme'
" pane
Plug 'gcmt/taboo.vim'
    let g:taboo_tab_format = ' %N %f%m '
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
    set laststatus=2 " required by vim-airline
    let g:airline_theme='quantum'
    let g:airline_left_sep = ''
    let g:airline_right_sep = ''
    let g:airline_section_z = ''
Plug 'tpope/vim-fugitive'
    nnoremap <leader>gs :GitStatus <CR>
Plug 'scrooloose/nerdtree'
    map <leader>n :NERDTreeToggle<CR>:NERDTreeMirror<CR>
    let NERDTreeIgnore = ['\.pyc$', '\.a$', '\.o$', '\.cmake$', '.*CMakeFiles.*', '\.dylib$']
Plug 'majutsushi/tagbar'
    map <leader>b :TagbarToggle<CR>
Plug 'kien/ctrlp.vim'
    nnoremap <leader>o :CtrlP<CR>
    let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
" display
Plug 'nathanaelkane/vim-indent-guides'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'ntpeters/vim-better-whitespace'
" edit
Plug 'roxma/vim-paste-easy'
Plug 'scrooloose/nerdcommenter'
    let g:NERDSpaceDelims=1
Plug 'terryma/vim-multiple-cursors'
" heavy
silent! Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --go-completer --js-completer --quiet' }
    nnoremap gd :YcmCompleter GoToImprecise<CR>
    nnoremap gn :YcmCompleter GetType<CR>
    map <F8> :YcmCompleter FixIt<CR>
" Plug 'w0rp/ale'
" Plug 'chiel92/vim-autoformat'
    " noremap <leader>f :Autoformat<CR> :w<CR>
" disabled
" All of your Plugins must be added before the following line
call plug#end()            " required

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
" set colorcolumn=80
" not highlight the editing line
set nocursorline
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
" about indent
set expandtab smarttab shiftwidth=4 softtabstop=4 tabstop=4
" color and theme
if (empty($TMUX))
  if (has("termguicolors"))
    set termguicolors
  endif
endif
set background=dark
silent! colorscheme tender
set t_Co=256
" encoding
set encoding=utf-8
" make vim scrolling fast
set ttyfast
" fast updatetime
set updatetime=100
" set whitespace character
set listchars=tab:▸\ ,eol:¬
" set non-text character
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
" show the github permlink for the selected line(s). Adapted from https://felixge.de/2013/08/08/vim-trick-open-current-line-on-github.html
nnoremap <leader>gh :!echo `git url`/blob/`git rev-parse HEAD`/%\#L<C-R>=line('.')<CR><CR>
vnoremap <leader>gh <Esc>:!echo `git url`/blob/`git rev-parse HEAD`/%\#L<C-R>=line("'<")<CR>-L<C-R>=line("'>")<CR><CR>
" keymapping
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>vs :source ~/.vimrc<CR>
nnoremap <leader>ve :tabe ~/.vimrc<CR>
if has('nvim')
    nnoremap <leader>z :tabe<CR>:terminal<CR>i
    tnoremap <Esc> <C-\><C-n>
endif
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>1 1gt<CR>
nnoremap <leader>2 2gt<CR>
nnoremap <leader>3 3gt<CR>
nnoremap <leader>4 4gt<CR>
nnoremap <leader>5 5gt<CR>
nnoremap <leader>6 6gt<CR>
nnoremap <leader>7 7gt<CR>
nnoremap <leader>8 8gt<CR>
nnoremap <leader>9 9gt<CR>
nnoremap <leader>[ gT<CR>
nnoremap <leader>] gt<CR>
nnoremap <leader>e :botright cwindow<CR>
nnoremap <F9> :make<CR>
nnoremap <leader><F9> :make clean && make<CR>
nnoremap <leader>f :py3file ~/.vim/clang-format.py<CR>
nnoremap <leader><Bslash>w :w !sudo tee %<CR>
nnoremap <leader><Bslash>q :q!<CR>
map q: :q
set pastetoggle=<F10>
" add cscope
if has("cscope")
    set csto=1
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
    nnoremap g0 :cs find 0 <C-R>=expand("<cword>")<CR><CR>
    nnoremap g1 :cs find 1 <C-R>=expand("<cword>")<CR><CR>
    nnoremap g2 :cs find 2 <C-R>=expand("<cword>")<CR><CR>
    nnoremap g3 :cs find 3 <C-R>=expand("<cword>")<CR><CR>
    nnoremap g4 :cs find 4 <C-R>=expand("<cword>")<CR><CR>
    nnoremap g6 :cs find 6 <C-R>=expand("<cword>")<CR><CR>
    nnoremap g7 :cs find 7 <C-R>=expand("<cword>")<CR><CR>
    nnoremap g8 :cs find 8 <C-R>=expand("<cword>")<CR><CR>
    nnoremap g9 :cs find 9 <C-R>=expand("<cword>")<CR><CR>
    " refresh cscope database in current directory
    nnoremap <leader>cr :!cscope -Rb <CR> :cs reset<CR>
endif
" add Silver Searcher ag
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
  nnoremap gw :grep <C-R>=expand("<cword>")<CR><CR>
endif
