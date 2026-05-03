# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# ベル無効
setopt no_beep

# 補完候補を方向キーで選択可能にする
zstyle ':completion:*:default' menu select=2

# 入力ミスを訂正
setopt correct

# 日本語ファイル名に対応
setopt print_eight_bit

# ディレクトリ末尾に/を自動付与
setopt auto_param_slash

# ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt mark_dirs

# ファイルの種類を示すマークを表示
setopt list_types

# Tab連打で候補を切り替え
setopt auto_menu

# =以降も補完
setopt magic_equal_subst

# 入力途中でも補完
setopt complete_in_word

# ドット無しで隠しファイルをマッチ
setopt globdots

# 大文字・小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Ctrl+Dでログアウトしない
setopt IGNORE_EOF

# zmv
autoload -Uz zmv

#
# 履歴
#

export HISTFILE=${HOME}/.zhistory
export HISTSIZE=100000
export SAVEHIST=100000

# スペースで始まるコマンドを除外
setopt hist_ignore_space

# 重複するコマンドを除外
setopt hist_ignore_dups

# ヒストリに同じコマンドがあるなら古い方を削除
setopt hist_ignore_all_dups

## zshプラグイン
## https://github.com/rossmacarthur/sheldon
eval "$(sheldon source)"

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
# homebrewの更新・削除・クリーンアップをまとめて行なう
alias brewu='brew upgrade && brew autoremove && brew cleanup -s'
# 天気予報
alias wttr='(){ curl -H "Accept-Language: ${LANG%_*}" --compressed "wttr.in/${1:-Tokyo}" }'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
