# /etc/nixos/modules/agenix.nix
{ config, pkgs, ... }:

let
  # Download the agenix source once (to avoid repeated fetches)
  agenixSrc = builtins.fetchTarball "https://github.com/ryantm/agenix/archive/main.tar.gz";
  secrets = import ../secrets/secrets.nix;  # adjust path as needed
in
{
  # import the library
  imports = [
    "${agenixSrc}/modules/age.nix"
  ];

  # install the command line utility
  environment.systemPackages = with pkgs; [
    (callPackage "${agenixSrc}/pkgs/agenix.nix" {})
  ];

  # pull all secrets into the config
  age.secrets = builtins.mapAttrs (name: attrs: {
    file = ../secrets/${name};   # adjust path based on your module location
    owner = attrs.owner or "root";
    group = attrs.group or "root";
    mode = attrs.mode or "0400";
  }) secrets;
}
