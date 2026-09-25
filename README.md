> after some thinking... i have decided to stop thinking.

This is my NixOS configuration as a flake. NixOS 26.05 and nixpkgs-unstable where I need it.

## Usage

```sh
sudo nixos-rebuild switch --flake .#hostname   # to apply host-specific configuration
nix flake update                               # to update inputs (nixpkgs, nixpkgs-unstable)
nix fmt                                        # format each file with alejandra
```

## Layout

| Path | What it is |
| ---- | ---------- |
| `flake.nix` | Entry point. Defines hosts, exports packages, overlays, modules, formatter |
| `nixos/` | Per-machine glue: `configuration.nix` + generated `hardware-configuration.nix`. Will be used for multiple hosts later |
| `home-manager/` | User config entry point (`home.nix` for `yujiqo`). Will be used for multiple users probably |
| `modules/nixos/` | System modules that are shared between hosts |
| `modules/home-manager/` | `packages.nix` (what's installed), `symlinks.nix` (dotfiles → `~/.config`) |
| `overlays/` | `additions` (local pkgs), `modifications` (empty for now), `unstable-packages` (`pkgs.unstable`) |
| `pkgs/` | Custom packages (empty, waiting for a reason) |
| `yurice/` | ⚠️ Separate git repo. The rice itself |
| `dotfiles/` | ⚠️ Separate git repo. Plain-text configs — git, opencode, that contain me-specific settings |

`yurice` and `dotfiles` are gitignored here and live in their own repos.
`symlinks.nix` symlinks their `config/` dirs into `~/.config` — so they stay editable
without a rebuild (out-of-store symlinks).

## Conventions

- Modules are small, wired up via `lib.attrValues` in the entry points
- `hardware-configuration.nix` is machine-generated, don't hand-edit
- Formatting is `alejandra`; run `nix fmt` to auto format
- All program configs configured with their specific format even if they have home-manager options
