{pkgs, ...}: {
  programs.firefoxpwa = {
    enable = true;
    package = pkgs.unstable.firefoxpwa;
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
          manifestUrl = "https://www.icloud.com/";
          desktopEntry.icon = ./pwa-icons/icloud.png;
          desktopEntry.categories = ["Network" "Office"];
        };
        "01K9YEHHRFGE0Y1QDFJBP0YKNZ" = {
          name = "Claude";
          url = "https://claude.ai/new";
          manifestUrl = "https://claude.ai/manifest.json";
          desktopEntry.icon = ./pwa-icons/claude.png;
          desktopEntry.categories = ["Network" "Utility"];
        };
        "01M79HP32Z4EJP4JP164G6HXM9" = {
          name = "ChatGPT";
          url = "https://chatgpt.com/";
          manifestUrl = "https://chatgpt.com/";
          desktopEntry.icon = ./pwa-icons/chatgpt.png;
          desktopEntry.categories = ["Network" "Utility"];
        };
      };
    };
  };
}
