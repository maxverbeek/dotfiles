" Load plugin loader
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins!
call plug#begin()

Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'joshdick/onedark.vim'
Plug '/usr/bin/fzf'
Plug 'lervag/vimtex'
Plug 'tpope/vim-repeat'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'conornewton/vim-pandoc-markdown-preview'
Plug 'scrooloose/nerdcommenter' 
Plug 'jiangmiao/auto-pairs'
Plug 'dhruvasagar/vim-table-mode'
call plug#end()

syntax on 
colorscheme onedark
set termguicolors

" Indentation
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set mouse=a

" Line nums
set number relativenumber

" FZF file finder
let $FZF_DEFAULT_COMMAND = "find -L -not -path '*/\.git/*'"
nnoremap <silent> <C-p> :FZF<CR>

" Vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

augroup latexSurround
 autocmd!
 autocmd FileType tex call s:latexSurround()
augroup END

function! s:latexSurround()
 let b:surround_{char2nr("e")} = "\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}"
 let b:surround_{char2nr("c")} = "\\\1command: \1{\r}"
endfunction

" vim-pandoc
let g:md_pdf_viewer="zathura"
