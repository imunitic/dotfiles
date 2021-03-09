{pkgs, ...}:

{
  home.packages = [
        pkgs.rlwrap
        pkgs.rustup
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
  ];


  programs.man.enable = false;
}
