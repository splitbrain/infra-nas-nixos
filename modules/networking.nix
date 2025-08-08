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

    nftables.enable = true; # new nft instead of iptables

    firewall = {
      enable = true;
      allowedTCPPorts = [
        5001
        22000 # syncthing
        51413 # bittorrent (forwarded from router)
      ];
      allowedUDPPorts = [
        51820 # wireguard (forwarded from router)
        22000 # syncthing
        21027 # syncthing
        51413 # bittorrent (forwarded from router)
        1900  # gerbera UPNP
      ];

      # always let docker images access host services
      extraInputRules = ''
        ip saddr 172.16.0.0/12 accept
      '';
    };
  };

  services.openssh.enable = true;
}
