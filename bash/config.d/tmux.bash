config-tmux() {
  # Set prefix
  tmux unbind C-b
  tmux set -g prefix C-Space

  # Mouse mode
  tmux set -g mouse on

  # Splitting and navigating panes
  tmux unbind %
  tmux unbind '"'
  tmux bind v split-window -h -c "#{pane_current_path}"
  tmux bind x split-window -v -c "#{pane_current_path}"
  # vim integration
  is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
  tmux bind -n C-h if-shell "$is_vim" "send-keys C-h" "select-pane -L"
  tmux bind -n C-j if-shell "$is_vim" "send-keys C-j" "select-pane -D"
  tmux bind -n C-k if-shell "$is_vim" "send-keys C-k" "select-pane -U"
  tmux bind -n C-l if-shell "$is_vim" "send-keys C-l" "select-pane -R"
  tmux set -sg escape-time 0 # Avoid delay when inputting 'esc'

  # Splitting windows
  tmux unbind n # Unbind move to next window
  tmux unbind w # Unbind change current window interactively
  tmux bind n command-prompt "rename-window '%%'"
  tmux bind w new-window -c "#{pane_current_path}"
  tmux bind -n M-j previous-window
  tmux bind -n M-k next-window

  # Copy mode
  tmux set-window-option -g mode-keys vi
  tmux unbind -T copy-mode-vi Space
  tmux unbind -T copy-mode-vi Enter
  tmux bind -T copy-mode-vi v send-keys -X begin-selection
  tmux bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "xsel --clipboard"
}

config-tmux

unset -f config-tmux
