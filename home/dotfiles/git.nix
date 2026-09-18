{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "yujiqo";
        email = "danilastolyarov97@gmail.com";
      };
      pull.rebase = true;
      init.defaultBranch = "main";
    };
  };
}
