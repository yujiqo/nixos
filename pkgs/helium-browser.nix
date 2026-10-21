{
  appimageTools,
  fetchurl,
  lib,
}: let
  version = "0.19.4.1";
in
  appimageTools.wrapType2 {
    pname = "helium-browser";
    inherit version;

    src = fetchurl {
      url = "https://github.com/imputnet/helium-linux/releases/download/${version}/helium-${version}-x86_64.AppImage";
      sha256 = "5b2db392b3ed87f24aa844936059d68aca98bc20548eaaa0decfa3c280a2a0a7";
    };

    meta = {
      description = "Private, fast, and honest web browser";
      homepage = "https://helium.computer/";
      license = lib.licenses.gpl3Only;
      mainProgram = "helium-browser";
      platforms = ["x86_64-linux"];
    };
  }
