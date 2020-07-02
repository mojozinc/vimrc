""""""""""""""""Plugins""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'jremmen/vim-ripgrep'
Plug 'machakann/vim-highlightedyank'
Plug 'vim-airline/vim-airline'
Plug 'skywind3000/vim-preview'
Plug 'lifepillar/vim-mucomplete'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'mbbill/undotree'
Plug 'puremourning/vimspector'
Plug 'ap/vim-css-color'
" needs nvim
Plug 'ThePrimeagen/vim-be-good'
"Plug 'git@github.com:Valloric/YouCompleteMe.git'
call plug#end()
let g:vimspector_enable_mappings = 'HUMAN'
if executable('rg')
    let g:rg_derive_root='true'
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=%{FugitiveStatusline()}
""""""""""""""""""""display whitespace character"""""""""""""""""""""""""""""""
" set list 
" set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color schemes""""""""""""""""""""""""""""""""
" colo one-dark
" colo atom
colo gruvbox
" colo dracula
"""""""""""""""""""""""""""""""""""""""""""""""
""""""Python configs"""""""""""""""""""""""""""
let python_highlight_all=1
set backspace=2
set completeopt=menuone,noinsert
"""""""""""""""""""""""""""""""""""""""""""""""
""""""" block commenting"""""""""""""""""""""""
vnoremap <silent> # :s/^/#/<cr>:noh<cr>
vnoremap <silent> -# :s/^#//<cr>:noh<cr>
"""""""""""""""""""""""""""""""""""""""""""""""
"""" key bindings""""""""""""""""""""""""""""""
let mapleader = ","
" open fzf finder, simulate cmd+shift+p
nmap <leader>p :GFiles<CR>
nmap <leader><space> :Rg<SPACE>
nmap <leader>s :Rg <C-R>=expand("<cword>")<CR><CR>
nmap <C-f> :BLines<CR>
map <C-d> :NERDTreeToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""
"""" Defaults"""""
syntax on
set number relativenumber " line numbers
set hlsearch " highlight searched text
set incsearch " search text incrementally
set ignorecase " case insensitive search
set smartcase
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set smartindent
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set cursorline
set splitright

"set colorcolumn=80
"highlight ColorColumn ctermbg=7

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
autocmd BufNewFile,BufRead *Dockerfile* set filetype=dockerfile
autocmd BufNewFile,BufRead *Dockerfile* set syntax=dockerfile
" autocmd BufWritePost * !run_tests.sh <afile>

" toggle relativenumber
augroup numbertoggle
    au!
    autocmd BufEnter,FocusGained * set relativenumber
    autocmd BufLeave,FocusLost * set norelativenumber
augroup END

" to preview ack results
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>


