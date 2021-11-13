function fish_greeting
    neofetch
    fortune
end
funcsave fish_greeting

set PATH /usr/local/lib/node_modules $PATH

# bindings
# Clears the terminal and redraws the prompt
bind \cz 'clear; neofetch; fortune; commandline -f repaint-mode'
