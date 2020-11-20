# Set PATH
set PATH $PATH $HOME/.local/bin
set PATH $PATH $HOME/.cargo/bin

# Set starship as the default prompt
starship init fish | source

# Use Solorized Dark colorscheme
eval (dircolors -c $HOME/.local/git/dircolors-solarized/dircolors.256dark)

# Init conda
# eval /home/uy/.miniconda3/bin/conda "shell.fish" "hook" $argv | source

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

