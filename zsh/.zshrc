# 環境変数
export LANG=ja_JP.UTF-8

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

# 直前のコマンドの重複削除
setopt hist_ignore_dups

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# 同時に起動したzsh間でヒストリを共有
setopt share_history

# lsした際にファイル種別で色分け
export CLICOLOR=1
export LSCOLORS="GxFxCxDxBxegedabagaced"

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完候補を詰めて表示
setopt list_packed

# 補完候補一覧をカラー表示
autoload colors
zstyle '*completion:*' list-colors ''

# コマンドのスペルを訂正
setopt correct

# ビープ音を鳴らさない
setopt no_beep

# ディレクトリスタック
DIRSTACKSIZE=100
setopt AUTO_PUSHD

# git
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
zstyle ':vcs_info:git:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:git:*' actionformats '[%b|%a]'
precmd () {vcs_info}

# プロンプトカスタマイズ
PROMPT='%F{220}%~%f %F{cyan}$vcs_info_msg_0_%f
▶︎ '

# コマンド間に1行挟む
autoload -Uz add-zsh-hook
add-zsh-hook precmd add_line
add_line() {printf "\n"}
