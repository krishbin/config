#zsh_setup
for f in ~/.config/shell_config/config_zsh/*(.); do source "$f"; done

for file in ~/.config/shell_config/plugins_zsh/*(.); do source "$file"; done

export TERMINAL='alacritty'

export FPATH="$FPATH:/opt/local/share/zsh/site-functions/"
if [ -f /opt/local/etc/profile.d/autojump.sh ]; then
        . /opt/local/etc/profile.d/autojump.sh
fi
[ -f /opt/local/share/fzf/shell/key-bindings.zsh ] && source /opt/local/share/fzf/shell/key-bindings.zsh 

source ~/.config/shell_config/zsh-autosuggestions/zsh-autosuggestions.zsh
export TMUXP_CONFIGDIR=$HOME/.config/tmuxp
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export PROMPT_EOL_MARK=''
export CARGO_HOME=/usr/local/lang/rust/cargo
export RUSTUP_HOME=/usr/local/lang/rust/rustup
