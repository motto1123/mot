# neovim setting
export HOME="$HOME/mot"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
 
# Path to your oh-my-zsh installation.
export MYVIMRCSUB=$HOME/vim_setting/
#export ZSH=$HOME/.oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
# Path to python-program
ZSH_THEME="sporty_256" 

plugins=(git)

#
# ファイルの呼び出し
#

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/peco-scripts/peco-select-history.zsh
source $HOME/zsh-vimode-visual/zsh-vimode-visual.zsh  # visual mode command の説明あり

# User configuration
export MANPATH="/usr/local/man:$MANPATH"

#
# peco setting
#

bindkey '^r' peco-select-history
#履歴ファイルの保存先
export HISTFILE=$HOME/.zsh_history
## メモリに保存される履歴の件数
export HISTSIZE=10000
## 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000
## 重複を記録しない
setopt hist_ignore_dups
# スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_space
# 余分な空白は詰めて記録
setopt hist_reduce_blanks  

# 古いコマンドと同じものは無視 
setopt hist_save_no_dups

# historyコマンドは履歴に登録しない
setopt hist_no_store

# 補完時にヒストリを自動的に展開         
setopt hist_expand

#
# vim bindkey
#

bindkey -M vicmd 'L' end-of-line 
bindkey -M vicmd 'H' beginning-of-line
bindkey 'jj' vi-cmd-mode

# 
# vim モード切り替え http://qiita.com/syui/items/8cc534c2c30543965950
#

function zle-line-init zle-keymap-select {
    VIM_NORMAL="%K{208}%F{black}%k%f%K{208}%F{white} % NORMAL %k%f%K{black}%F{208}%k%f"
    VIM_INSERT="%K{075}%F{black}%k%f%K{075}%F{white} % INSERT %k%f%K{black}%F{075}%k%f"
    RPS1="${${KEYMAP/vicmd/$VIM_NORMAL}/(main|viins)/$VIM_INSERT}"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select



#
# その他
#


# 補完時に濁点・半濁点を <3099> <309a> のように表示させない
setopt COMBINING_CHARS

#
# zsh での補完
#

# zhs-completions   
# http://blog.scimpr.com/2014/12/14/mac%E3%81%ABzsh-completions%E3%82%92%E5%B0%8E%E5%85%A5%EF%BC%86docker%E7%94%A8%E3%81%AEcompletion%E3%82%82%E5%B0%8E%E5%85%A5/
fpath=(/usr/local/share/zsh-completions $fpath)
fpath=(~/.zsh/completion $fpath)


