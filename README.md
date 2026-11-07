<div align="center">

<img src="https://raw.githubusercontent.com/NixOS/nixos-artwork/master/logo/nix-snowflake-colours.svg" width="120" alt="nixos logo">

# nixos

_after some thinking... i have decided to stop thinking._

[![NixOS 26.05](https://img.shields.io/badge/NixOS-26.05-5277C3?style=for-the-badge&logo=nixos&logoColor=white)](https://nixos.org)
[![nixpkgs unstable](https://img.shields.io/badge/nixpkgs-unstable-7EBAE4?style=for-the-badge&logo=nixos&logoColor=white)](https://github.com/NixOS/nixpkgs/tree/nixos-unstable)
[![home-manager](https://img.shields.io/badge/home--manager-26.05-5277C3?style=for-the-badge&logo=nixos&logoColor=white)](https://github.com/nix-community/home-manager)
[![nix-darwin](https://img.shields.io/badge/nix--darwin-26.05-7EBAE4?style=for-the-badge&logo=apple&logoColor=white)](https://github.com/nix-darwin/nix-darwin)

![flakes](https://img.shields.io/badge/flakes-enabled-1e1e2e?style=flat-square&logoColor=7EBAE4)
![formatter](https://img.shields.io/badge/fmt-alejandra-1e1e2e?style=flat-square)
![platforms](https://img.shields.io/badge/platforms-x86__64--linux%20·%20aarch64--darwin-1e1e2e?style=flat-square)
![wm](https://img.shields.io/badge/wm-niri-1e1e2e?style=flat-square)
![shell](https://img.shields.io/badge/shell-fish-1e1e2e?style=flat-square&logoColor=white)
[![license](https://img.shields.io/badge/license-MIT-1e1e2e?style=flat-square)](LICENSE)

</div>

my nixos + nix-darwin config as one flake. three machines, two operating systems,
one user (`yujiqo`). stable `nixos-26.05` everywhere, `nixpkgs-unstable` only where i ask for it.

---

## Hosts

| Host       | OS         | Arch             | Hardware                                                                               | Dir                                 |
| ---------- | ---------- | ---------------- | -------------------------------------------------------------------------------------- | ----------------------------------- |
| `thinkpad` | NixOS      | `x86_64-linux`   | Intel iGPU (`intel-media-driver`, `vpl-gpu-rt`), battery charge limit `85,90`          | [`hosts/thinkpad/`](hosts/thinkpad) |
| `tuf`      | NixOS      | `x86_64-linux`   | Intel + NVIDIA (PRIME offload, open driver, `PCI:0:2:0` / `PCI:1:0:0`)                 | [`hosts/tuf/`](hosts/tuf)           |
| `macbook`  | nix-darwin | `aarch64-darwin` | Apple Silicon. GUI apps are Homebrew casks, theme comes from the wallpaper via matugen | [`hosts/macbook/`](hosts/macbook)   |

shared across hosts

- desktop (linux): niri + quickshell, SDDM on wayland, adw-gtk3 dark, gnome/gtk portals
- shell: fish + starship, kitty, tmux, neovim
- network: tailscale, ssh with keys only and no root login, nftables firewall that trusts the tailscale interface, systemd-resolved with `DNSSEC=allow-downgrade`
- nix: flakes, no channels, no global registry, `auto-optimise-store`, weekly gc of anything older than 7 days
- locale: `Asia/Almaty`, `en_US.UTF-8`, `us,ru` layout with caps ↔ escape and alt+shift to switch

---

## Layout

### tree

```text
.
├── flake.nix                     # inputs, hosts, exported modules, overlays, formatter
├── hosts/
│   ├── thinkpad/
│   │   ├── nixos/                # configuration.nix, hardware-configuration.nix, modules/{hardware,network,users}
│   │   └── home-manager/         # home.nix + modules/ (host-specific packages)
│   ├── tuf/                      # same shape as thinkpad
│   └── macbook/
│       ├── darwin/               # configuration.nix for nix-darwin
│       └── home-manager/         # home.nix for /Users/yujiqo
├── modules/
│   ├── nixos/                    # system modules for every NixOS host
│   ├── darwin/                   # system modules for the mac
│   └── home-manager/
│       ├── common/               # every host
│       ├── linux/                # linux hosts
│       └── darwin/               # the mac
├── overlays/                     # additions · modifications · unstable-packages
├── pkgs/                         # custom packages (empty, waiting for a reason)
├── yurice/                       # separate repo: the rice!!!
└── dotfiles/                     # separate repo: personal plain-text configs!!!
```

> [!NOTE]
> **`yurice/` and `dotfiles/` are separate git repos.** they're gitignored here and cloned inside this one.
>
> - [**yurice**](https://github.com/yujiqo/yurice): the rice.
> - [**dotfiles**](https://github.com/yujiqo/dotfiles): configs with personal settings.
>
> `symlinks.nix` links their `config/` dirs into `~/.config` with `mkOutOfStoreSymlink`, so you can edit them live without a rebuild.

---

## Usage

### bootstrap

the symlinks expect everything under `~/.nixos`:

```sh
git clone git@github.com:yujiqo/nixos.git    ~/.nixos
git clone git@github.com:yujiqo/yurice.git   ~/.nixos/yurice
git clone git@github.com:yujiqo/dotfiles.git ~/.nixos/dotfiles
cd ~/.nixos
```

### rebuild

```sh
sudo nixos-rebuild switch --flake .#thinkpad   # thinkpad
sudo nixos-rebuild switch --flake .#tuf        # tuf
sudo darwin-rebuild switch --flake .#macbook   # macbook
```

### maintain

```sh
nix flake update   # bump nixpkgs, nixpkgs-unstable, home-manager, nix-darwin
nix fmt .          # format every .nix file with alejandra
nix flake show     # list what the flake exports
```

> [!TIP]
> on the mac, `yurice-sync` rebuilds the matugen palette from the current wallpaper
> (`--force` skips the cache). a launchd agent already runs it whenever the wallpaper
> changes. logs go to `~/Library/Logs/yurice-matugen.log`.

<details>
<summary><b>adding a new nixos host</b></summary>

1. copy an existing host: `cp -r hosts/thinkpad hosts/<name>`
2. regenerate the hardware config on the machine:
   `nixos-generate-config --show-hardware-config > hosts/<name>/nixos/hardware-configuration.nix`
3. set `networking.hostName` in `hosts/<name>/nixos/modules/network.nix`, then adjust `hardware.nix`
4. register it in `flake.nix`:

   ```nix
   nixosConfigurations.<name> = nixpkgs.lib.nixosSystem {
     specialArgs = {inherit inputs;};
     modules = [./hosts/<name>/nixos/configuration.nix];
   };
   ```

5. `sudo nixos-rebuild switch --flake .#<name>`

</details>

---

## Conventions

- every `default.nix` is just an attrset of paths, and entry points import it with `lib.attrValues`.
- each `home.nix` imports its own `modules/`, then `homeModules.common`, then its platform set (`linux` or `darwin`).
- platform code lives in its platform dir, not behind `mkIf`. if something only exists on one OS, it goes in that OS's folder.
- program configs stay in their own formats in yurice/dotfiles, even when home-manager has options for them. nix only installs packages and creates symlinks.
- stable is the default. anything newer is pulled explicitly with `pkgs.unstable.*` (claude-code, opencode, firefoxpwa, tetro-tui).
- each entry in a package list gets a short trailing `# why it's here`.
- `hardware-configuration.nix` is machine-generated, so don't edit it by hand.
- format before committing. `nix fmt .` (alejandra).

---

<div align="center">
<sub>
  rice: <a href="https://github.com/yujiqo/yurice">yurice</a> ·
  configs: <a href="https://github.com/yujiqo/dotfiles">dotfiles</a> ·
  <a href="LICENSE">MIT</a>
</sub>
</div>
