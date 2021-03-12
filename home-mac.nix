{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.man.enable = false;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "herrflick";
  home.homeDirectory = "/Users/herrflick";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";

  home.packages = [
        pkgs.rlwrap
        pkgs.rustup
        pkgs.rust-analyzer
        pkgs.nox
        pkgs.niv
        pkgs.lorri
        pkgs.universal-ctags
        pkgs.direnv
        pkgs.go-langserver
        pkgs.entr
        pkgs.fd
        pkgs.ag
        pkgs.mage
        pkgs.grpcurl
        pkgs.prototool
        pkgs.protobuf
        pkgs.go-protobuf
        pkgs.python38Packages.virtualenv
        pkgs.prototool
        pkgs.stack
        pkgs.lf
        pkgs.k9s
        pkgs.nodejs
        pkgs.git
        pkgs.google-cloud-sdk
  ];
}
