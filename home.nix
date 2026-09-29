{ config, pkgs, ... }:

{
  home.username = "amish";
  home.homeDirectory = "/home/amish";
  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    fastfetch

    sway
    waybar
    mako
    wmenu
    foot
    swaylock
    swayidle

    ripgrep
    fzf
    fd

    neovim

    pavucontrol
    wireplumber

    nerd-fonts.jetbrains-mono
  ];

  programs.zsh.enable = true;

  programs.git = {
  	enable = true;
	userName = "Amish Kumar Singh";
	userEmail = "amish.kumar1211@gmail.com";
  }

  xdg.configFile = {
    "sway".source = ./configs/sway;
    "nvim".source = ./configs/nvim;
    "waybar".source = ./configs/waybar;
    "mako".source = ./configs/mako;
    "foot".source = ./configs/foot;
  };

  home.file.".zshrc".source = ./configs/zshrc;
}
