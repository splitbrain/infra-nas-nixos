{ config, pkgs, ... }:

{
  networking = {
    hostName = "nas";
    useDHCP = false;
    hostId = "3a4ebe94"; # head -c4 /dev/urandom | od -A none -t x4

    interfaces.enp4s0 = {
      useDHCP = false;
      ipv4.addresses = [{
        address = "192.168.1.33";
        prefixLength = 24;
      }];
    };

    defaultGateway = "192.168.1.1";
    nameservers = [ "192.168.1.1" ];

    firewall = {
      enable = true;
      allowedTCPPorts = [ 5001 22000];
      allowedUDPPorts = [ 51820 22000 21027 ];
    };
  };

  services.openssh.enable = true;
}
