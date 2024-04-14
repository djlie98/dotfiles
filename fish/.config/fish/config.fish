if status is-interactive
    # Commands to run in interactive sessions can go here
    atuin init fish | source
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    set GOPATH $HOME/go
    set PATH $PATH ~/.cargo/bin $GOPATH/bin
    set PKG_CONFIG_PATH /usr/lib/pkgconfig:/usr/share/pkgconfig:/usr/lib/x86_64-linux-gnu
    set TZ Asia/Jakarta
    alias ls="eza --icons --group-directories-first"
    alias ll="eza --icons --group-directories-first -l"
    alias la="eza --icons --group-directories-first -a"
    alias v="nvim"
    alias cat="bat"
    if not set -q TMUX
      set -g TMUX tmux new-session -d -s base
      eval $TMUX
      tmux attach-session -d -t base
    end
end
starship init fish | source
