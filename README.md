# vim rc
contents of .vim directory

First install vim plug manually from here -> https://github.com/junegunn/vim-plug

contents of ~/.config/nvim/init.vim
```
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vim/vimrc
```

TODO:
1. make changes to boot vim from ~/.config/nvim instead of redirecting here
