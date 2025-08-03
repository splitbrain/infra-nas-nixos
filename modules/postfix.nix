{ config, pkgs, ... }:

{
  services.postfix = {
    enable = true;
    relayHost = "mail.smtp2go.com";
    relayPort = 587;
    hostname = "mail.69b.place";
    domain = "69b.place";
    origin = "69b.place";
    extraConfig = ''
      smtp_sasl_auth_enable = yes
      smtp_sasl_password_maps = texthash:${config.age.secrets."postfix-sasl_passwd.age".path}
      local_header_rewrite_clients = static:all
      append_dot_mydomain = yes
    '';
    networks = [
      "192.168.1.0/24"
      "172.16.0.0/12"
    ];
  };

  networking.firewall.allowedTCPPorts = [ 25 ];
}
