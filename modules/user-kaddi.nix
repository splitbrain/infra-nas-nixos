{ config, pkgs, ... }:

{
  users.users.kaddi = {
    isNormalUser = true;
  };
}
