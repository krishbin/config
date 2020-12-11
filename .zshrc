#zsh_setup
for f in ~/.config/shell_config/config_zsh/*(.); do source "$f"; done

for file in ~/.config/shell_config/plugins_zsh/*(.); do source "$file"; done

export TERMINAL='iTerm'

export FPATH="$FPATH:/opt/local/share/zsh/site-functions/"
if [ -f /opt/local/etc/profile.d/autojump.sh ]; then
        . /opt/local/etc/profile.d/autojump.sh
fi
[ -f /opt/local/share/fzf/shell/key-bindings.zsh ] && source /opt/local/share/fzf/shell/key-bindings.zsh 

source ~/.config/shell_config/zsh-autosuggestions/zsh-autosuggestions.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
        eval "$__conda_setup"
else
        if [ -f "/usr/local/miniconda/etc/profile.d/conda.sh" ]; then
                . "/usr/local/miniconda/etc/profile.d/conda.sh"
        else
                export PATH="/usr/local/miniconda/bin:$PATH"
        fi
fi
unset __conda_setup
# <<< conda initialize <<<

export TMUXP_CONFIGDIR=$HOME/.config/tmuxp
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export PROMPT_EOL_MARK=''
export CARGO_HOME=/usr/local/lang/rust/cargo
export RUSTUP_HOME=/usr/local/lang/rust/rustup
