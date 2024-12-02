{ config, pkgs, ... }:
{
  services.postgresql = {
    enable = true;
    ensureDatabases=[
      "nexus_development"
    ];
    ensureUsers = [
      {
        name = "the_goat";
        password = "GOAT";
        ensurePermissions = {
          "ALL TABLES IN SCHEMA public" = "ALL PRIVILEGES";
        };
      }
    ];
  };
}
