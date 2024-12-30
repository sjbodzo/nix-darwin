{ config, inputs, pkgs, lib, ... }:

let dotfiles = inputs.dotfiles;
in {

  # moar https://github.com/yuanw/nix-home/blob/main/modules/macintosh.nix

  # import sub modules
  imports = [
    # ./docker.nix
    ./gpg.nix
    ./fonts.nix
    ./link-home-manager-installed-apps.nix
    (inputs.nix-home-manager + "/modules")
  ];

  # home manager needs this
  home = {
    username = "jessbodzo";
    homeDirectory = "/Users/jessbodzo";
    stateVersion = "23.11";
  };

  # https://github.com/NixOS/nixpkgs/blob/master/pkgs/os-specific/darwin/
  home.packages = with pkgs; [
    coreutils
    # ghostty - lacks flake support for aarch64 darwin
  ];

  # TODO hardware.keyboard.zsa.enable
}
