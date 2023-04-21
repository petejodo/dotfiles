if status is-interactive
    # Commands to run in interactive sessions can go here

    set -x FLYCTL_INSTALL "~/.fly"
    set -x ERL_AFLAGS "-kernel shell_history enabled -kernel shell_history_file_bytes 1024000"
    fish_add_path ~/.fly/bin

    source ~/.asdf/asdf.fish
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

    fish_add_path ~/.cargo/bin
    fish_add_path ~/.local/bin
    fish_add_path /home/linuxbrew/.linuxbrew/lib/ruby/gems/3.1.0/bin

    alias l="exa -lh --icons"
    alias cat="batcat"

    alias gs="git status"

    starship init fish | source 
end
