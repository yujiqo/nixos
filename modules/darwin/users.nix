{pkgs, ...}: {
  system.primaryUser = "yujiqo";

  users.users.yujiqo = {
    home = "/Users/yujiqo";
  };
}
