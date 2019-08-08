" GitHub for vim-fugitive needs pathogen.vim:
execute pathogen#infect()

" Vim-Fugitive key mappings
" First writes file, then adds it, then commits it!
nmap <leader>gw :write <bar> :Git add %:p <bar> :Gcommit %:p<CR>
" Git pull
nmap <leader>go :Gpull<CR>
" Pushes branch to origin.
nmap <leader>gp  :execute ":Git push origin " . fugitive#head(0)<CR>
" Git status
nmap <leader>gs :Gstatus<CR>
" Git diff
nmap <leader>gd :Gdiff<CR>
" Checks out file currently editing (trash curr edit file & add back file)
nmap <leader>gc  :execute ":Git checkout %"<CR>


" Python
set nocompatible              " required
filetype off                  " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
" ...
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'junegunn/seoul256.vim'

" Angular
Plugin 'burnettk/vim-angular'
" JavaScript
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
"Plugin 'matthewsimo/angular-vim-snippets'
"Plugin 'claco/jasmine.vim'
Plugin 'scrooloose/syntastic.git'
" TypeScript
Plugin 'quramy/tsuquyomi'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/vim-js-pretty-template'
Plugin 'jason0x43/vim-js-indent'
" html
Plugin 'othree/html5.vim'

" ...
" All of your Plugins must be added before the following line
call vundle#end()           " required
filetype plugin indent on   " required

" Split Navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za 

" Enable docstrings for folded code
let g:SimpylFold_docstring_preview=1

" Add proper PEP8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Make sure vim knows to use UTF8 when working with Python
set encoding=utf-8

" YouCompleteMe Customizations
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Let Python make ur code look pretty =D
let python_highlight_all=1
syntax on



" NERDTree open with shortcut
map <C-n> :NERDTreeToggle<CR>
" Ignore .pyc files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']
" Open NERDTree on right side instead of left
let g:NERDTreeWinPos = "right"
" Change default width to 29 columns
let g:NERDTreeWinSize=29

" seoul256 Colorscheme shrimp... someday ill get er workin how I want.
"colorscheme seoul256
" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
" seoul256 (light):
"   Range:   252 (darkest) ~ 256 (lightest)
"   Default: 253
"let g:seoul256_background = 233
"let g:seoul256_light_background = 256
"colo seoul256
"colo seoul256-light


" Python with virtualenv support
" IDK WHY THIS IS BROKEN BUT I THINK ITS SUM PYTHON 2 VS 3 CRRRREP!
" py << EOF
" import os
" import sys
" if 'VIRTUAL_ENV' in os.environ:
"   project_base_dir = os.environ['VIRTUAL_ENV']
"   activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"   execfile(activate_this, dict(__file__=activate_this))
" EOF


" All the old stuff.
:set hls
:set incsearch
:set number
":color desert

" Cuz anybody who isn't full stack dev has a weak mind.
" ALSO peep the plugin 'ftypes' some day.
au BufNewFile,BufRead *.java,*.jss,*.c,*.css
    \ syntax on |
    \ set expandtab |
    \ set shiftwidth=4 |
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set cindent

au BufNewFile,BufRead *.html
    \ syntax on |
    \ set expandtab |
    \ set shiftwidth=2 |
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |



" JavaScript
" Enable syntax highlighting for JSDocs.
let g:javascript_plugin_jsdoc = 1 
" Enable some addditional syntax highlighting for NGDocs.
let g:javascript_plugin_ngdoc = 1
" Enable syntax highlighting for Flow.
let g:javascript_plugin_flow = 1
" Code folding for JavaScript.
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

