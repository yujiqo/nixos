# nixos

> after some thinking... i have decided to stop thinking.

My NixOS configuration as a flake. One machine — **`tuf`** (ASUS TUF, Intel + NVIDIA
hybrid) — system-level config and home-manager share the same modules. NixOS 26.05,
nixpkgs-unstable where I need it, unfree allowed.

## Usage

```sh
sudo nixos-rebuild switch --flake .#tuf   # apply
nix flake update                          # update inputs
nix fmt                                   # format with alejandra
```

## Layout

| Path | What it is |
| ---- | ---------- |
| `flake.nix` | Entry point. Defines host `tuf`, exports packages, overlays, modules, formatter |
| `nixos/` | Per-machine glue: `configuration.nix` + generated `hardware-configuration.nix` |
| `home-manager/` | User config entry point (`home.nix` for `yujiqo`) |
| `modules/nixos/` | System modules split by concern: boot, hardware, network, localization, gui, users, core |
| `modules/home-manager/` | User bits: `packages.nix` (what's installed), `symlinks.nix` (dotfiles → `~/.config`) |
| `overlays/` | `additions` (local pkgs), `modifications` (empty for now), `unstable-packages` (`pkgs.unstable`) |
| `pkgs/` | Custom packages (empty, waiting for a reason) |
| `yurice/` | ⚠️ Separate git repo. The rice — niri, kitty, fish, starship, nvim, tmux… |
| `dotfiles/` | ⚠️ Separate git repo. Plain-text configs — git, opencode |

`yurice` and `dotfiles` are gitignored here and live in their own repos.
`symlinks.nix` symlinks their `config/` dirs into `~/.config` — so they stay editable
without a rebuild (out-of-store symlinks).

## Conventions

- Modules are small, one concern each, wired up via `lib.attrValues` in the entry points
- Everything is a flake input or a module — no imperative stuff
- `hardware-configuration.nix` is machine-generated, don't hand-edit
- Formatting is `alejandra`; run `nix fmt`

# this one is just a generated placeholder which i'll edit once i get home.
