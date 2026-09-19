{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    prefix = "C-a";
    mouse = true;
    escapeTime = 10;
    focusEvents = true;
    historyLimit = 10000;
    keyMode = "vi";
    customPaneNavigationAndResize = true;
    plugins = with pkgs.tmuxPlugins; [
      yank
    ];
    extraConfig = ''
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf

      set -sa terminal-overrides ",xterm-256color:RGB"

      unbind '"'
      bind h split-window -v -c "#{pane_current_path}"
      unbind %
      bind v split-window -h -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"

      is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
          | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?|fzf)(diff)?$'"
      bind-key -n "C-h" if-shell "$is_vim" "send-keys C-h"  "select-pane -L"
      bind-key -n "C-j" if-shell "$is_vim" "send-keys C-j"  "select-pane -D"
      bind-key -n "C-k" if-shell "$is_vim" "send-keys C-k"  "select-pane -U"
      bind-key -n "C-l" if-shell "$is_vim" "send-keys C-l"  "select-pane -R"

      set -g status-style "fg=#858585, bg=default"
      set -g status-right "#H"
      set-option -g default-terminal "screen-256color"

      bind -T copy-mode    C-S-c send -X copy-pipe-no-clear "wl-copy"
      bind -T copy-mode-vi C-S-c send -X copy-pipe-no-clear "wl-copy"
    '';
  };
}
