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
