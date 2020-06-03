set number " line numbers
set hlsearch " highlight searched text
set incsearch " search text incrementally
set ignorecase " case insensitive search
set smartcase
syntax on
set tabstop=4 shiftwidth=4 expandtab
""""""""""""""""Plugins""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mcchrish/nnn.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'mileszs/ack.vim'
"Plug 'voldikss/vim-floaterm'
call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=%{FugitiveStatusline()}
""""""Custom functions""""""""""""""""""""""""""""""""
function SetJsonLOptions()
    set filetype=jsonl
    set syntax=json
endfunction

function JsonLineView()
     y | tabnew | 0put | .!python -m json.tool
     set filetype=json
endfunction

autocmd BufNewFile,BufRead *.jsonl call SetJsonLOptions()
autocmd FileType jsonl nnoremap <buffer> <F5> :call JsonLineView()<CR>
""""""""""""""""""""display whitespace character"""""""""""""""""""""""""""""""
" set list 
" set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color schemes""""""""""""""""""""""""""""""""
" colo one-dark
colo atom
" colo dracula
"""""""""""""""""""""""""""""""""""""""""""""""
""""""Python configs"""""""""""""""""""""""""""
let python_highlight_all=1
set backspace=2
"""""""""""""""""""""""""""""""""""""""""""""""
""""""" block commenting"""""""""""""""""""""""
vnoremap <silent> # :s/^/#/<cr>:noh<cr>
vnoremap <silent> -# :s/^#//<cr>:noh<cr>
"""""""""""""""""""""""""""""""""""""""""""""""
"""" key bindings""""""""""""""""""""""""""""""
let mapleader = ","
" open fzf finder, simulate cmd+shift+p
nnoremap <leader>p :Files<CR>
" nnn file manager
let g:nnn#set_default_mappings = 0
nnoremap <leader>nn :NnnPicker<CR>
""""""""""""""""""""""""""""""""""""""""""""""
