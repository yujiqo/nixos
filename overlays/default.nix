{inputs, ...}: {
  additions = final: prev:
    if prev.stdenv.hostPlatform.system == "x86_64-linux"
    then
      import ../pkgs {
        pkgs = prev;
        system = prev.stdenv.hostPlatform.system;
      }
    else {};

  modifications = final: prev: {
  };

  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.stdenv.hostPlatform.system;
      config.allowUnfree = true;
    };
  };
}
