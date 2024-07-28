
#python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# pre-commit
export PATH="$HOME/.pre-commit-venv/bin/pre-commit:$PATH"

fpath=(/usr/local/share/zsh-completions ${fpath})

autoload -U compinit && compinit -u

autoload bashcompinit && bashcompinit
complete -C '/opt/homebrew/bin/aws_completer' aws


# 小文字でも大文字ディレクトリ、ファイルを補完できるようにする
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完候補に色つける
autoload -U colors
colors
zstyle ':completion:*' list-colors "${LS_COLORS}"

# 単語の入力途中でもTab補完を有効化
setopt complete_in_word
# 補完候補をハイライト
zstyle ':completion:*:default' menu select=1
# キャッシュの利用による補完の高速化
zstyle ':completion::complete:*' use-cache true
# 大文字、小文字を区別せず補完する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完リストの表示間隔を狭くする
setopt list_packed

# コマンドの打ち間違いを指摘してくれる
setopt correct
SPROMPT="correct: $RED%R$DEFAULT -> $GREEN%r$DEFAULT ? [Yes/No/Abort/Edit] => "


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# powerlavelのテーマ
source /opt/homebrew/opt/powerlevel10k/share/powerlevel10k/powerlevel10k.zsh-theme


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=13'
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src


setopt print_eight_bit
setopt no_beep
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000


# # ==zshプラグイン==
# plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
# source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/Cellar/tfenv/3.0.0/versions/1.5.4/terraform terraform

# github CLI
eval "$(gh completion -s zsh)"

# git rebase --command
function git-rebase-branch() {
    # カレントブランチの最初のコミットを取得
    first_commit=$(git rev-list --max-parents=0 HEAD)
    # インタラクティブリベースを実行
    git rebase -i $first_commit
}


# alias
alias python='python3'
alias pip='pip3'
alias q='exit'
alias cl='clear'
alias ga='git add -A'
alias gc='git commit'
alias gpull="git fetch -p && git pull"
alias gpush="git push origin HEAD"
alias glog='git log --graph --date=short --abbrev-commit -n 10'
alias gsave='git stash save -u'
alias gpr='!hub browse -- pulls/$(git config user.name)'
alias g="git"
alias grebase='git-rebase-branch'
alias gs='git switch'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/umi/.pyenv/versions/miniforge3-22.11.1-4/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/umi/.pyenv/versions/miniforge3-22.11.1-4/etc/profile.d/conda.sh" ]; then
        . "/Users/umi/.pyenv/versions/miniforge3-22.11.1-4/etc/profile.d/conda.sh"
    else
        export PATH="/Users/umi/.pyenv/versions/miniforge3-22.11.1-4/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
