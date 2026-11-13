{pkgs, ...}: {
  home.packages = with pkgs; [
    unstable.claude-code # og ai agents
    unstable.codex # og? ai agents
    unstable.opencode # free ai agents
  ];
}
