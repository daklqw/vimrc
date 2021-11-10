""""""""""""""""""""""""""""""""
" vimrc of daklqw(daklqw@outlook.com)
""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""
" System detection
""""""""""""""""""""""""""""""""
let vimFilesPath = "~/.vim"
if (has('win32') || has('win64'))
	let vimFilesPath = "~/vimfiles"
endif

""""""""""""""""""""""""""""""""
" Basic settings (default settings)
""""""""""""""""""""""""""""""""
set backspace=indent,eol,start
set guioptions=
set guifont=Courier\ New:h14b
set number relativenumber
set list listchars=tab:\|\ ,trail:@
set tabstop=4 shiftwidth=4
set cursorline
colorscheme PaperColor
syntax on

""""""""""""""""""""""""""""""""
" Vundle configure
""""""""""""""""""""""""""""""""
filetype off
set nocompatible
set shellslash " for fucking Windows
execute "set rtp+=" . vimFilesPath . "/bundle/Vundle.vim"
call vundle#begin(vimFilesPath . "/bundle")
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/OmniCppComplete'
Plugin 'preservim/nerdtree'
call vundle#end()
filetype plugin indent on " This may cause shit-like experience of Python

""""""""""""""""""""""""""""""""
" Airline configure (Plugin vim-airline)
""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1

""""""""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""""""""
function OpenFileInFileManager()
	" explorer only accepts '\'
	let l:fileName = substitute(expand("%:p"), '/', '\\', 'g')
	silent execute ':!explorer /select,'.l:fileName
endfunction

""""""""""""""""""""""""""""""""
" Key maps
""""""""""""""""""""""""""""""""
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap <M-h> <C-W>h
nnoremap <M-j> <C-W>j
nnoremap <M-k> <C-W>k
nnoremap <M-l> <C-W>l

nnoremap \\ \|

let mapleader = ","

" Build
nnoremap <leader>bb <ESC>:make<CR>

" Comment
nnoremap <leader>cc <ESC>:call snippet#insertComment()<CR>

" File
nnoremap <leader>ff <ESC>:call OpenFileInFileManager()<CR>
nnoremap <leader>ft <ESC>:NERDTree<CR>

" Project
nnoremap <leader>pr <ESC>:call project#reloadConfigure()<CR>

" cTags
nnoremap <leader>tt <ESC>:silent !ctags -R<CR>

" Vimrc
nnoremap <leader>ve <ESC>:sp $MYVIMRC<CR>
nnoremap <leader>vs <ESC>:source $MYVIMRC<CR>
nnoremap <leader>vi <ESC>:PluginInstall<CR>
nnoremap <leader>vt <ESC>:echom 'Avalanche, Toss!'<CR>

""""""""""""""""""""""""""""""""
" Abbreviations
""""""""""""""""""""""""""""""""
iabbrev @@@ daklqw(daklqw@outlook.com)
