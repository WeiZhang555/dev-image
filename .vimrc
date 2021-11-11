set nu
set tabstop=4
set shiftwidth=4
set hlsearch

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" rust env setup
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'
let g:rustfmt_autosave = 1
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!
let g:racer_cmd = "/home/zhangwei/.cargo/bin/racer"
let g:racer_experimental_completer = 1

" rego related
Plugin 'tsandall/vim-rego'
let g:formatdef_rego = '"opa fmt"'
let g:formatters_rego = ['rego']
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_verbosemode = 1
"au BufWritePre *.rego Autoformat

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'cespare/vim-golang'
Bundle 'dgryski/vim-godef'
Bundle 'Blackrush/vim-gocode'
filetype plugin indent on
syntax on
autocmd BufWritePre *.go :Fmt

Bundle 'majutsushi/tagbar'
nmap <F4> :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
	\ }
nmap <F5> :NERDTree<CR>
nmap <F3> :tselect<CR>

set rtp+=/home/zhangwei/program/gocode/src/github.com/golang/lint/misc/vim
" autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow

set laststatus=2
