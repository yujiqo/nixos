{pkgs, ...}: {
  home.packages = with pkgs; [
    unstable.claude-code # og ai agents
    unstable.opencode # ai agents
  ];
}
