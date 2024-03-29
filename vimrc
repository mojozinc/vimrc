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
Plug 'davidhalter/jedi-vim'
"Plug 'jeetsukumaran/vim-pythonsense'
"Plug 'puremourning/vimspector'
Plug 'vimwiki/vimwiki'
Plug 'justinmk/vim-sneak'
Plug 'psf/black', {'branch': 'stable'}
" Typescript setup
Plug 'pangloss/vim-javascript' 
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
" needs nvim
Plug 'ThePrimeagen/vim-be-good'
"Plug 'git@github.com:Valloric/YouCompleteMe.git'
Plug 'rust-lang/rust.vim'
call plug#end()
"let g:vimspector_enable_mappings = 'HUMAN'
let g:python3_host_prog = 'python3'
if executable('rg')
    let g:rg_derive_root='true'
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" StatusLines
"set statusline=%{FugitiveStatusline()}
" add custom data - https://github.com/vim-airline/vim-airline#straightforward-customization
" list buffers in tabline
let g:airline#extensions#tabline#enabled = 1
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
nmap <leader>t :Buffers<CR>
nmap <leader><space> :Rg<SPACE>
nmap <leader>s :Rg <C-R>=expand("<cword>")<CR><CR>
nmap <C-f> :BLines<CR>
map <C-d> :NERDTreeToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""
"""" Defaults"""""
syntax on
set number norelativenumber " line numbers
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

function PPTMode()
    set number relativenumber
    set scrolloff=999
endfunction

autocmd BufNewFile,BufRead *.jsonl call SetJsonLOptions()
autocmd BufNewFile,BufRead *.ndjson call SetJsonLOptions()
autocmd FileType ndjson nnoremap <buffer> <F5> :call JsonLineView()<CR>
autocmd BufNewFile,BufRead *Dockerfile* set filetype=dockerfile
autocmd BufNewFile,BufRead *Dockerfile* set syntax=dockerfile
" autocmd BufWritePost * !run_tests.sh <afile>

" to preview ack results
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>

" run python auto save
function! TogglePythonSaveGroup()
    if !exists('#PythonSaveGroup#BufWritePost')
        augroup PythonSaveGroup | au!
            autocmd BufWritePost *.py !black <afile>:p:S
        augroup end
    else
        augroup PythonSaveGroup | au!
            autocmd!
        augroup end
    endif
endfunction

function! GetPythonSaveStatus()
    if exists('#PythonSaveGroup#BufWritePost') && (&filetype=='python')
        return '| format on save'
    else
        return ''
    endif
endfunction
command BlackToggle execute 'call TogglePythonSaveGroup()'
BlackToggle
call airline#parts#define_function('python_black', 'GetPythonSaveStatus')
let g:airline_section_y = airline#section#create_right(['ffenc','python_black'])

" --------------------------------------

augroup RustSaveGroup | au!
    autocmd BufWritePost *.rs :RustFmt
augroup end
