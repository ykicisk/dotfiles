# usage

## dependencies

* coreutils (OSX)
* tmux-2.1
* vim (with lua)

## preparation

```sh
# zplug & zshrc
$ curl -sL get.zplug.sh | zsh
$ curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
$ touch ~/.zshenv
$ echo 'autoload -Uz compinit
compinit' >> ~/.zshenv

# dein vim
$ mkdir .vim
$ sh ./installer.sh .vim/dein
$ cp -r .vim/dein/repos/github.com/tomasr/molokai/colors .vim

# git setting
$ git config --global core.editor 'vim -c "set fenc=utf-8"'
```

