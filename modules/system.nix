{ config, pkgs, ... }:

{
  # boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # disk additions to hardware-configuration.nix
  fileSystems."/".options = [ "noatime" ];

  # recommended buffer sizes for syncthing
  # https://github.com/quic-go/quic-go/wiki/UDP-Buffer-Sizes
  boot.kernel.sysctl."net.core.rmem_max" = 7500000;
  boot.kernel.sysctl."net.core.wmem_max" = 7500000;

  # passwordless sudo, keep ssh agent
  security.sudo.wheelNeedsPassword = false;
  security.sudo.extraConfig = ''
    Defaults:root,%wheel env_keep += "SSH_AUTH_SOCK"
  '';

  # users are declarative only
  users.mutableUsers = false;

  # locale
  time.timeZone = "Europe/Berlin";
  console.keyMap = "de";

  # Clean the Nix store every week.
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # nixos specifics
  system.copySystemConfiguration = true;
  system.stateVersion = "25.11"; # keep as is!

}
