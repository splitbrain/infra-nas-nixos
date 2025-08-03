{ config, pkgs, ... }:

{
  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.forceImportRoot = false;

  services.zfs.trim.enable = true;
  services.zfs.autoScrub.enable = true;


  services.zfs.zed.enableMail = true;
  services.zfs.zed.settings = {
    ZED_EMAIL_ADDR = [ "splitbrain@gmail.com" ];
    ZED_EMAIL_PROG = "${pkgs.mailutils}/bin/mail";
    ZED_EMAIL_OPTS = "-s '@SUBJECT@' @ADDRESS@";

    ZED_NOTIFY_INTERVAL_SECS = 3600;
    ZED_NOTIFY_VERBOSE = true;
  };
}
