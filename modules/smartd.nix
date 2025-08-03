{ config, pkgs, ... }:

{
  services.smartd = {
    enable = true;
    # all monitoring, offline collection, shorttest daily, longtest weekly
    defaults.monitored = "-a -o on -s (S/../.././02|L/../../6/03)";
    notifications = {
      mail = {
        enable = true;
        recipient = "splitbrain@gmail.com";
      };
      # test = true; # mail on startup
    };
  };
}
