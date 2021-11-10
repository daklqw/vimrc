""""""""""""""""""""""""""""""""
" snippet.vim
" author: daklqw(daklqw@outlook.com)
""""""""""""""""""""""""""""""""

function! snippet#insertComment()
	if &filetype == 'vim'
		call append(line('.'), '""""""""""""""""""""""""""""""""')
		call append(line('.'), '"')
		call append(line('.'), '""""""""""""""""""""""""""""""""')
	elseif &filetype == 'cpp'
		call append(line('.'), '*******************************/')
		call append(line('.'), '*')
		call append(line('.'), '/*******************************')
	else
		call append(line('.'), '################################')
		call append(line('.'), '#')
		call append(line('.'), '################################')
	endif
endfunction
