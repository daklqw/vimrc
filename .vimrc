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
set guifont=Iosevka:h13
set number relativenumber
set list listchars=tab:\|\ ,trail:@
set tabstop=4 shiftwidth=4
set cursorline
set splitbelow
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
Plugin 'preservim/tagbar'
call vundle#end()
filetype plugin indent on " This may cause shit-like experience of Python

""""""""""""""""""""""""""""""""
" Plugin configure
""""""""""""""""""""""""""""""""
" Airline
let g:airline#extensions#tabline#enabled = 1

" Tagbar
let g:tagbar_width = 25
" let g:tagbar_autofocus = 1

" NERDTree
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['\~$', '\.swp']

" plugin initialization
augroup pluginInit
	autocmd!
	autocmd VimEnter * :NERDTree
	autocmd VimEnter * :TagbarToggle
	autocmd VimEnter * :wincmd p
	autocmd GUIEnter * :simalt ~x
augroup END


""""""""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""""""""
function OpenFileInFileManager()
	" explorer only accepts '\'
	let l:fileName = substitute(expand("%:p"), '/', '\\', 'g')
	silent execute ':silent !explorer /select,'.l:fileName
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
nnoremap <leader>bt <ESC>:term<CR>

" Comment
nnoremap <leader>cc <ESC>:call snippet#insertComment()<CR>

" File
nnoremap <leader>ff <ESC>:call OpenFileInFileManager()<CR>
nnoremap <leader>fe <ESC>:NERDTree<CR>

" Project
nnoremap <leader>pr <ESC>:call project#reloadConfigure()<CR>

" cTags
nnoremap <leader>tr <ESC>:silent !ctags -R<CR>
nnoremap <leader>tt <ESC>:TagbarToggle<CR>

" Vimrc
nnoremap <leader>ve <ESC>:sp $MYVIMRC<CR>
nnoremap <leader>vs <ESC>:source $MYVIMRC<CR>
nnoremap <leader>vi <ESC>:PluginInstall<CR>
nnoremap <leader>vt <ESC>:echom 'Avalanche, Toss!'<CR>

""""""""""""""""""""""""""""""""
" Abbreviations
""""""""""""""""""""""""""""""""
iabbrev @@@ daklqw(daklqw@outlook.com)
