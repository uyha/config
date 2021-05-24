# Set PATH
set PATH $HOME/.local/python3.9/bin \
         $HOME/.local/bin \
         $HOME/.cargo/bin \
         $HOME/.yarn/bin \
         /mnt/c/Windows \
         $PATH

# Set starship as the default prompt
set -x STARSHIP_CONFIG $HOME/.config/starship.toml
starship init fish | source

# Use Solorized Dark colorscheme
eval (dircolors -c $HOME/.local/git/dircolors-solarized/dircolors.256dark)

# Cursor shape
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block

# Set visual and editor to neovim
set -gx VISUAL nvim
set -gx EDITOR $VISUAL

# Set environment variables
set -x config "$HOME/.config"
set -x local "$HOME/.local"
set -x POETRY_HOME $local

# Set DISPLAY for Server X
set -x DISPLAY (grep -oP "nameserver \K.*" /etc/resolv.conf):0.0

