{pkgs, ...}: {
  home.packages = with pkgs; [
    # programming languages
    rustup # rust tools manager
    gcc # c/c++ compiler
    nodejs # javascript
    uv # python package manager
    postgresql # sql db
    dotnet-sdk # c# tools
  ];
}
