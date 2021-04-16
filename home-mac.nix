{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.man.enable = false;

  programs.git = {
    enable = true;
    userName = "Ivica Munitic";
    userEmail = "ivica.munitic@kiwi.com";
  };

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

  home.file.".zshrc".source = "${config.home.homeDirectory}/Development/personal/dotfiles/zshrc";
  home.file.".vimrc".source = "${config.home.homeDirectory}/Development/personal/dotfiles/vimrc";
  home.file.".config/nvim/init.vim".source = "${config.home.homeDirectory}/Development/personal/dotfiles/vimrc";
  home.file.".config/alacritty/alacritty.yml".source = "${config.home.homeDirectory}/Development/personal/dotfiles/alacritty.yml";

  home.packages = [
        # Development
        pkgs.rlwrap
        pkgs.rustup
        pkgs.rust-analyzer
        pkgs.universal-ctags
        pkgs.direnv
        pkgs.go
        pkgs.gopls
        pkgs.go-protobuf
        pkgs.grpcurl
        pkgs.prototool
        pkgs.protobuf
        pkgs.python3
        pkgs.pipenv
        pkgs.prototool
        pkgs.ghc
        pkgs.cabal-install
        pkgs.stack
        pkgs.haskell-language-server
        pkgs.nodejs
        pkgs.yarn
        pkgs.niv
        pkgs.ldc
        pkgs.rdmd
        pkgs.dtools
        pkgs.dub
        pkgs.libiconv
        pkgs.cmake
        pkgs.elmPackages.elm
 
        # Utils
        pkgs.fzf
        pkgs.entr
        pkgs.fd
        pkgs.ag
        pkgs.ripgrep
        pkgs.bat
        pkgs.lf
        pkgs.k9s
        pkgs.git
        pkgs.google-cloud-sdk
        pkgs.zinit
        pkgs.watch
        pkgs.nix-tree
        pkgs.lazygit
        pkgs.dive

        # Programs
        pkgs.tmux
        pkgs.starship
        pkgs.neovim

        # Fonts
        pkgs.nerdfonts

        # Vim plugins
        pkgs.vimPlugins.Vundle-vim
  ];
}
