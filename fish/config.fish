# Set starship as the default prompt
starship init fish | source

# Use Solorized Dark colorscheme
eval (dircolors -c $HOME/.local/git/dircolors-solarized/dircolors.256dark)

# Set PATH
set PATH $PATH /mnt/c/Windows
set PATH $PATH $HOME/.local/bin
