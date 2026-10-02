> after some thinking... i have decided to stop thinking.

This is my NixOS + nix-darwin configuration as a flake. NixOS 26.05 and nixpkgs-unstable where I need it.

## Hosts

| Host | Platform | Dir |
| ---- | -------- | --- |
| `tuf` | NixOS, x86_64-linux | [`hosts/tuf/`](hosts/tuf) |
| `macbook` | nix-darwin, aarch64-darwin | [`hosts/macbook/`](hosts/macbook) |

## Usage

```sh
sudo nixos-rebuild switch --flake .#tuf        # to apply host-specific configuration
sudo darwin-rebuild switch --flake .#macbook    # same, for the mac
nix flake update                                # to update inputs (nixpkgs, nixpkgs-unstable, nix-darwin)
nix fmt                                         # format each file with alejandra
```

## Layout

| Path | What it is |
| ---- | ---------- |
| `flake.nix` | Entry point. Defines hosts, exports packages, overlays, modules, formatter |
| `hosts/tuf/nixos/` | `configuration.nix` + generated `hardware-configuration.nix` |
| `hosts/tuf/home-manager/` | User config (`home.nix` for `yujiqo`) |
| `hosts/macbook/darwin/` | `configuration.nix` for nix-darwin |
| `hosts/macbook/home-manager/` | Same user config, but for darwin (`/Users/yujiqo`) |
| `modules/nixos/` | NixOS system modules, wired up via `lib.attrValues` |
| `modules/darwin/` | nix-darwin system modules, same idea |
| `modules/home-manager/linux/` | `packages.nix` + `symlinks.nix` for NixOS |
| `modules/home-manager/darwin/` | Same, for macOS |
| `overlays/` | `additions` (local pkgs), `modifications` (empty for now), `unstable-packages` (`pkgs.unstable`) |
| `pkgs/` | Custom packages (empty, waiting for a reason) |
| [`yurice/`](https://github.com/yujiqo/yurice) | ⚠️ Separate git repo. The rice itself |
| [`dotfiles/`](https://github.com/yujiqo/dotfiles) | ⚠️ Separate git repo. Plain-text configs — git, opencode, karabiner, that contain me-specific settings |

`yurice` and `dotfiles` are gitignored here and live in their own repos.
`symlinks.nix` symlinks their `config/` dirs into `~/.config` — so they stay editable
without a rebuild (out-of-store symlinks).

## Conventions

- Modules are small, wired up via `lib.attrValues` in the entry points
- Each host's `home.nix` picks its own platform set: `homeModules.linux` or `homeModules.darwin`
- `hardware-configuration.nix` is machine-generated, don't hand-edit
- Formatting is `alejandra`; run `nix fmt` to auto format
- All program configs configured with their specific format even if they have home-manager options
- System modules that only exist on one platform live in that platform's dir, not behind `mkIf`
