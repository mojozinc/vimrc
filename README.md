# vim rc

contents of .vim directory

add the below to ~/.config/init.vim and/or ~/.config/nvim/init.vim
```
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vim/vimrc
```

TODO:
1. make changes to boot vim from ~/.config/nvim instead of redirecting here
