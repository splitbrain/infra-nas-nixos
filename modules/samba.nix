{ config, pkgs, ... }:

{
  services = {
    samba = {
      enable = true;
      openFirewall = true;

      settings = {
        global = {
          "smb3 unix extensions" = "yes";
        };
        home = {
          comment = "Home Directory";
          path = "/home/%u";
          browsable = "yes";
          writable = "yes";
          "create mask" = "0600";
          "directory mask" = "0700";
        };
        music = {
          comment = "MP3 Collection";
          path = "/data/music";
          browsable = "yes";
          writable = "yes";
          "create mask" = "0664";
          "directory mask" = "0775";
          "force group" = "users";
        };
        video = {
          comment = "Movies and TV Shows";
          path = "/data/video";
          browsable = "yes";
          writable = "yes";
          "create mask" = "0664";
          "directory mask" = "0775";
          "force group" = "users";
        };
        photo = {
          comment = "Photos Collection";
          path = "/data/photo";
          browsable = "yes";
          writable = "yes";
          "create mask" = "0664";
          "directory mask" = "0775";
          "force group" = "users";
        };
        other = {
          comment = "Other Stuff";
          path = "/data/other";
          browsable = "yes";
          writable = "yes";
          "create mask" = "0664";
          "directory mask" = "0775";
          "force group" = "users";
        };
      };
    };


    # auto discovery advertising
    avahi.enable = true;
    samba-wsdd = {
      enable = true;
      openFirewall = true;
    };
  };

  # add user passwords
  systemd.services.samba-smbd.postStart =
  let
    users = [ "andi" "kaddi" ];
    setupUser = user: let
      passwordPath = config.age.secrets."user-${user}-clear.age".path;
      smbpasswd = "${config.services.samba.package}/bin/smbpasswd";
    in ''
      (echo $(< ${passwordPath});
       echo $(< ${passwordPath})) | \
        ${smbpasswd} -s -a ${user}
    '';
  in
  ''
    ${builtins.concatStringsSep "\n" (map setupUser users)}
  '';
}
