source ~/.zplug/zplug

zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "zsh-users/zsh-completions"
zplug "felixr/docker-zsh-completion"
zplug "tcnksm/docker-alias", of:zshrc, as:plugin

# theme
zplug "themes/steeef", from:oh-my-zsh

# setting for docker-machine
if type docker-machine >/dev/null 2>&1; then
    eval $(docker-machine env default)
	function docker_run() {
		docker-machine ssh default -At "docker run -v \"\$SSH_AUTH_SOCK:/ssh-agent\" -v `pwd`:/home/docker/share -e SSH_AUTH_SOCK=/ssh-agent $@"
	}
fi

# cd -> cd && ls
cd () {
	builtin cd "$@" && ls
}


# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
# Then, source plugins and add commands to $PATH
zplug load --verbose
