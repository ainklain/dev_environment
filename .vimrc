set nu
set nocompatible              " required
filetype off                  " required

"""""""""""""""""""""""""
" plug in
"""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')


Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'git://git.wincent.com/command-t.git'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'tpope/vim-abolish'
Plug 'Lokaltog/vim-easymotion'
Plug 'ronakg/quickr-cscope.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-vinegar'
Plug 'jpalardy/vim-slime', {'for':'python'}
Plug 'hanschen/vim-ipython-cell', {'for':'python'}


call plug#end()


""""""""""""""""""""""""""
" key mapping
"""""""""""""""""""""""""""

let mapleader = ","
" edit vimrc"
nnoremap <leader>ev :vsplit ~/.vimrc<cr>
" source vimrc"
nnoremap <leader>sv :source ~/.vimrc<cr>

" moving tab/window"
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"""""""""""""""""""""""""
" abbreviations
"""""""""""""""""""""""""

iabbrev @@ ainklain@gmail.com

""""""
" grouping 
"""""
" Vimscript file settings -------- {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

"""""""""""""""""""""""""""""""""""
"==== slime configuration 
"""""""""""""""""""""""""""""""""""
" always use tmux
let g:slime_target = 'tmux'

" fix paste issues in ipython
let g:slime_python_ipython = 1

" always send text to the top-right pane in the current tmux tab without asking
let g:slime_default_config = {
			\ 'socke_name': get(split($TMUX, ','), 0), 
			\ 'target_pane': '{top-right}' }
let g:slime_dont_ask_default = 1

"""""""""""""""""""""""""""""""""""
"==== ipython-cell configuration 
"""""""""""""""""""""""""""""""""""

" map <F5> to save and run script
nnoremap <F5> :w<CR>:IPythonCellRun<CR>
inoremap <F5> <C-o>:w<CR><C-o>:IPythonCellRun<CR>

" map <F6> to evaluate current cell without saving
nnoremap <F6> :IPythonCellExecuteCell<CR>
inoremap <F6> <C-o>:IPythonCellExecuteCell<CR>

" map <F7> to evaluate current cell and jump to next cell without saving
nnoremap <F7> :IPythonCellExecuteCellJump<CR>
inoremap <F7> <C-o>:IPythonCellExecuteCellJump<CR>





"============CoC setting======================
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
