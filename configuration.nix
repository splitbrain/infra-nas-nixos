{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/system.nix
      ./modules/zfs.nix
      ./modules/networking.nix
      ./modules/agenix.nix
      
      ./modules/user-root.nix
      ./modules/user-andi.nix
      ./modules/user-kaddi.nix
      
      ./modules/smartd.nix
      ./modules/postfix.nix
      ./modules/samba.nix
      ./modules/lsyncd.nix
    ];


  # packages
  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    btop
    mtr
    docker-compose
    inetutils
    lsof
    mailutils
  ];

  # programs (packages with setup stuff)
  programs.fish.enable = true;
  virtualisation.docker.enable = true;
  programs.vim.enable = true;
  programs.vim.defaultEditor = true;
  programs.vim.package = pkgs.vim-full;

}

