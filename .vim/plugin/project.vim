""""""""""""""""""""""""""""""""
" project.vim
" author: daklqw(daklqw@outlook.com)
""""""""""""""""""""""""""""""""

let g:project#configureFileName = ".prjrc"
let g:project#maxSearchingDepth = 3

function project#init()
	let g:project#initalFilePath = expand("%:p:h")
endfunction

function project#pathReset()
	execute ":cd ".g:project#initalFilePath
endfunction


function project#reloadConfigure()
	if expand("%") == ''
		return
	else
		let l:lst = "wtf#wtf"
		let l:now = "%:p:h"
		let l:depthnow = 0
		while l:depthnow < g:project#maxSearchingDepth
			" detect if l:now is the root path
			let l:pth = expand(l:now)
			if l:pth == l:lst
				break
			endif
			let l:lst = l:pth
			let l:fl = l:pth.'/'.g:project#configureFileName
			if filereadable(l:fl)
				execute ":cd ".l:pth
				execute ":source ".l:fl
				return
			endif
			let l:now = l:now.":h"
			let l:depthnow = l:depthnow + 1
		endwhile
	endif
endfunction

augroup project#autoReload
	autocmd!
	autocmd BufNewFile,BufRead .prjrc set filetype=vim
	autocmd VimEnter * :call project#init()
	autocmd VimEnter * :call project#reloadConfigure()
augroup END
