alias ls="ls -G"
alias ll="ls -al"
alias ..="cd .."
alias gitch="~/dev_server_settings/git_checkout.sh"

# gitのブランチ名を出したりする
if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi

if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
fi

PS1="[\h@\u:\W\$(__git_ps1)]\$ "


# cdしたあとにlsする
cd ()
{
    builtin cd "$@" && ls
}

export NVM_DIR="/Users/tooi/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# ローカルPCの各リポジトリのディレクトリ
export GTX_SYNC_LOCAL_DIR_SRC="/Users/tooi/Develop/gtx/gtx-src"
export GTX_SYNC_LOCAL_DIR_LANG="/Users/tooi/Develop/gtx/gtx-lang"
export GTX_SYNC_LOCAL_DIR_YAHOO="/Users/tooi/Develop/gtx/gtx-yahoo"
# 開発サーバーのホスト
export GTX_SYNC_REMOTE_SERVER_HOST="dev-tooi-gotenks.ane.ssk.ynwm.yahoo.co.jp"
# 開発サーバーの同期するディレクトリ
export GTX_SYNC_REMOTE_DIR="/home/tooi/sync"
