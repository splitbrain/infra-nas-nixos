{ config, pkgs, ... }:

{
  services.postfix = {
    enable = true;

    settings.main = {
      relayhost = [
        "[mail.smtp2go.com]:587"
      ];
      myhostname = "mail.69b.place";
      mydomain = "69b.place";
      myorigin = "69b.place";

      smtp_sasl_auth_enable = "yes";
      smtp_sasl_password_maps = ''texthash:${config.age.secrets."postfix-sasl_passwd.age".path}'';
      local_header_rewrite_clients = "static:all";
      append_dot_mydomain = "yes";

      mynetworks = [
        "192.168.1.0/24"
        "172.16.0.0/12"
      ];
    };
  };

  networking.firewall.allowedTCPPorts = [ 25 ];
}
