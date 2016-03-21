set nocompatible              " be iMproved, required
filetype off                  " required

" ====================
" Vundle 
" ====================
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

Plugin 'vim-pandoc/vim-pandoc'

Plugin 'vim-pandoc/vim-pandoc-syntax' 

Plugin 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = '/Users/Gnnng/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

"nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
"nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
"nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

Plugin 'scrooloose/syntastic'

Plugin 'rdnetto/YCM-Generator'

Plugin 'altercation/vim-colors-solarized'

Plugin 'tomasr/molokai'

Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
" must set to 2 when use powerline
set laststatus=2

Plugin 'scrooloose/nerdcommenter'

Plugin 'thinca/vim-quickrun'
" Let quickrun print on message box which could continue edit after any key
let g:quickrun_config = {
            \   "_" : {
            \       "outputter" : "message",
            \   },
            \}

Plugin 'scrooloose/nerdtree'
map <leader>n :NERDTreeToggle<CR>

Plugin 'trusktr/seti.vim'

Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}

Plugin 'fatih/vim-go'
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_fail_silently = 1


Plugin 'majutsushi/tagbar'
map <leader>t :TagbarToggle<CR>

Plugin 'Raimondi/delimitMate'

Plugin 'airblade/vim-gitgutter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
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

" ==================
" Custom Config
" ==================
set background=dark
colorscheme seti
syntax enable

" display line number
"set number

" when backspace key works at these situations
set backspace=eol,start,indent

" move across lines
set whichwrap+=<,>,h,l

" about search
set ignorecase
set smartcase
set hlsearch
set incsearch

" display cursor pos in status line
set ruler

" set column ruler
set colorcolumn=80

" about indent
set expandtab " always replace tabs with spaces

" combined settings
set shiftwidth=4
set softtabstop=4

" control how '\t' is displayed in vim
set tabstop=4

" not fold
set nofoldenable

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

" Add powerline font settings for Macvim
set guifont=Source\ code\ Pro\ for\ Powerline

au FileType go nmap <Leader>i <Plug>(go-info)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

if has("gui_running")
    set guioptions=
    set guifont=Roboto\ Mono\ Light\ for\ Powerline:h15
    set cul
endif
