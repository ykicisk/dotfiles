# usage

## dependencies

* coreutils (OSX)
* tmux-2.1
* vim (with lua)

## preparation

```sh
$ curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
$ mkdir .vim
$ sh ./installer.sh .vim/dein
$ cp -r .vim/dein/repos/github.com/tomasr/molokai/colors .vim
$ git config --global core.editor 'vim -c "set fenc=utf-8"'
```

