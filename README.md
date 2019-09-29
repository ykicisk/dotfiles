# usage

## dependencies

* coreutils (OSX)
* tmux-2.1
* nvim >= 0.4
* zplug

## preparation

### Install vim-plug

https://github.com/junegunn/vim-plug

```sh
# in nvim
:PlugInstall
```

### Install Coc-python

https://github.com/neoclide/coc.nvim
https://github.com/neoclide/coc-python

```sh
# in vim
:CocInstall coc-python
```

### Copy colors directory

```
cp -r .local/share/nvim/plugged/molokai/colors .config/nvim
```

