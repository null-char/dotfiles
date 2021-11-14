function fish_greeting
    neofetch
    fortune
end
funcsave fish_greeting

fish_add_path /usr/local/lib/node_modules/ $HOME/.local/bin $HOME/go/bin $HOME/.cargo/bin

# bindings
# Clears the terminal and redraws the prompt
bind \cz 'clear; neofetch; fortune; commandline -f repaint-mode'
