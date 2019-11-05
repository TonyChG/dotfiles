" TonyChG vimrc
" v2

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe'
Plug 'tomtom/tcomment_vim'

Plug 'Vimjas/vim-python-pep8-indent'
Plug 'tonychg/MagicTemplate'
Plug 'tonychg/mycolors', { 'as': 'mycolors' }
Plug 'posva/vim-vue'

call plug#end()

syntax on
set encoding=UTF-8
colorscheme mycolors

" Indent
" set autoindent
set smartindent
" set expandtab
set shiftwidth=4
set softtabstop=4
set laststatus=2

" Infos
set nonumber           " disable line numbers
" set showcmd          " show command in bottom bar
set wildmenu           " visual autocomplete for command menu
set timeout            " for mappings
set timeoutlen=1000    " default value
set ttimeout           " for key codes
set ttimeoutlen=0      " unnoticeable small value
set foldmethod=manual
set norelativenumber
set nocursorcolumn
set nocursorline
set synmaxcol=200

" Custom Keybindings
nnoremap <silent><f2> :!cat ~/.config/helpers<CR>
nnoremap <silent><C-c> :!ctags -R --languages=python --exclude=virtualenv<CR>

" Custom FileType
" autocmd InsertLeave * write
" autocmd BufWritePost * call s:autoFlake8()
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
au BufNewFile,BufRead *.vue setlocal noet ts=2 sw=2 sts=2 expandtab
autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby
autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType puppet setlocal ts=2 sts=2 sw=2 expandtab
"v autocmd BufEnter * silent! lcd %:p:hype
