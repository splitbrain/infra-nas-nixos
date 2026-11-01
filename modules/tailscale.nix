{ config, pkgs, ... }:

{
  # subnet router for remote access to the LAN
  # first login: sudo tailscale up --advertise-tags=tag:nas --advertise-routes=192.168.1.0/24
  services.tailscale = {
    enable = true;
    openFirewall = true; # allows direct connections, no port forward needed
    useRoutingFeatures = "server";
    extraSetFlags = [
      "--advertise-routes=192.168.1.0/24"
    ];
  };
}
