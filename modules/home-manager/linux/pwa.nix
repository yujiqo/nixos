{pkgs, ...}: {
  programs.firefoxpwa = {
    enable = true;
    package = pkgs.unstable.firefoxpwa; # stable 2.18.2 breaks on firefox 159 (BrowserContentHandler moved to moz-src)
    profiles."01KD8HPVE6NXHCPE6QD43T8014" = {
      name = "PWAs";
      sites = {
        "01K7S7VFQHBEPR2Z3XY22BBXK2" = {
          name = "YouTube Music";
          url = "https://music.youtube.com/";
          manifestUrl = "https://music.youtube.com/manifest.webmanifest";
          desktopEntry.icon = ./pwa-icons/youtube-music.png;
          desktopEntry.categories = ["AudioVideo" "Audio" "Player"];
        };
        "01KFHE78G3SZW1G2W25GWVV3KV" = {
          name = "iCloud";
          url = "https://www.icloud.com/";
          manifestUrl = "https://www.icloud.com/"; # icloud has no manifest, but option is required
          desktopEntry.icon = ./pwa-icons/icloud.png;
          desktopEntry.categories = ["Network" "Office"];
        };
      };
    };
  };
}
