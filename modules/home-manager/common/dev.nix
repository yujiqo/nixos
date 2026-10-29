{pkgs, ...}: {
  home.packages = with pkgs; [
    # og coding tooling
    git # og version control
    lazygit # og tui for git
    tmux # og terminal multiplexer

    # programming languages
    rustup # rust tools manager
    gcc # c/c++ compiler
    nodejs # javascript
    uv # python package manager
    postgresql # sql db
    dotnet-sdk # c# tools
  ];
}
