{ ... }:
{
  xdg.configFile."nvim" = {
    source = ./source/nvim;
    recursive = true;
  };
}
