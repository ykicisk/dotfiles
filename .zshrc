source ~/.zplug/zplug

# 「ユーザ名/リポジトリ名」で記述し、ダブルクォートで見やすく括る（括らなくてもいい）
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "plugins/git", from:oh-my-zsh
zplug "themes/steeef", from:oh-my-zsh

# check コマンドで未インストール項目があるかどうか verbose にチェックし
# false のとき（つまり未インストール項目がある）y/N プロンプトで
# インストールする
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# プラグインを読み込み、コマンドにパスを通す
zplug load --verbose

# cdコマンド実行後、lsを実行する
function cd() {
  builtin cd $@ && ls --color=auto;
}

# ls時に色を付ける
export LS_COLORS='di=36;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;46'
alias ls='ls --color=auto'
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit
compinit

# homebrew用
export PATH=/usr/local/bin:/usr/local/opt/coreutils/libexec/gnubin:$PATH

# 履歴
HISTFILE=~/.zsh_history
# メモリ上に保存される件数（検索できる件数）
HISTSIZE=100000
# ファイルに保存される件数
SAVEHIST=100000
# 履歴を複数の端末で共有する
setopt share_history
# 直前と同じコマンドの場合は履歴に追加しない
setopt hist_ignore_dups
# 重複するコマンドは古い法を削除する
setopt hist_ignore_all_dups
