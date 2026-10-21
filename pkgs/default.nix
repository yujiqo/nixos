{
  pkgs,
  system,
}:
pkgs.lib.optionalAttrs (system == "x86_64-linux") {
  helium-browser = pkgs.callPackage ./helium-browser.nix {};
}
