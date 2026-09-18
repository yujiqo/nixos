{ ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      name = "M+1Code Nerd Font Mono";
      size = 16.0;
    };
    themeFile = "rose-pine";
    shellIntegration.mode = "no-cursor";
    settings = {
      disable_ligatures = "always";
      cursor_shape = "block";
      cursor_shape_unfocused = "hollow";
      cursor_blink_interval = "0.5 ease-in-out";
      cursor_trail = 5;
      scrollback_lines = 10000;
      scrollbar = "never";
      touch_scroll_multiplier = 1.0;
      mouse_hide_wait = -1;
      url_style = "curly";
      open_url_with = "default";
      detect_urls = "yes";
      show_hyperlink_targets = "yes";
      paste_actions = "quote-urls-at-prompt,confirm";
      remember_window_size = "yes";
      remember_window_position = "yes";
      window_padding_width = "5 15";
      hide_window_decorations = "titlebar-only";
      confirm_os_window_close = 0;
      background_opacity = 0.8;
      background_blur = 64;
      shell = "fish";
      editor = "nvim";
      cursor = "none";
    };
  };
}
