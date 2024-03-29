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
  # home.file.".emacs".source = "${config.home.homeDirectory}/Development/personal/dotfiles/emacs";
  home.file.".config/nvim/init.vim".source = "${config.home.homeDirectory}/Development/personal/dotfiles/vimrc";
  home.file.".config/alacritty/alacritty.yml".source = "${config.home.homeDirectory}/Development/personal/dotfiles/alacritty.yml";
  home.file.".config/kitty/kitty.conf".source = "${config.home.homeDirectory}/Development/personal/dotfiles/kitty.conf";
  home.file.".config/nix/nix.conf".source = "${config.home.homeDirectory}/Development/personal/dotfiles/nix.conf";

  home.packages = [
        # Development
        pkgs.rlwrap
        pkgs.universal-ctags
        pkgs.direnv
        pkgs.gdb
        pkgs.go
        pkgs.gopls
        pkgs.python3
        pkgs.pipenv
        pkgs.nodejs
        pkgs.yarn
        pkgs.libiconv
        pkgs.elmPackages.elm
        pkgs.redis
	pkgs.babashka
 
        # Utils
        pkgs.fzf
        pkgs.entr
        pkgs.fd
        pkgs.silver-searcher
        pkgs.ripgrep
        pkgs.bat
        pkgs.lf
	pkgs.git
        pkgs.zinit
        pkgs.watch
        pkgs.nix-tree
        pkgs.lazygit
        pkgs.dive
        pkgs.glab
        pkgs.terraform
        pkgs.git-filter-repo
        pkgs.graphviz

        # Programs
        pkgs.tmux
        pkgs.starship
        pkgs.neovim
        pkgs.neofetch
        pkgs.htop
        pkgs.graphviz
        pkgs.mc
        # Fonts
        pkgs.nerdfonts

        # Vim plugins
        pkgs.vimPlugins.Vundle-vim
  ];
}
