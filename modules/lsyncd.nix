{ config, pkgs, ... }:

{
  environment.systemPackages = [ pkgs.lsyncd pkgs.rsync ];


  systemd.services.lsyncd-nixosbackup = {
    description = "lsyncd sync /etc/nixos to /data/nixos";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.lsyncd}/bin/lsyncd -nodaemon -direct /etc/nixos /data/nixos";
      Restart = "on-failure";
      RestartSec = "10s";
      User = "root";

      # Explicitly set the PATH to include rsync
      Environment = "PATH=${pkgs.rsync}/bin:${pkgs.coreutils}/bin:/run/current-system/sw/bin";
    };
  };

}
