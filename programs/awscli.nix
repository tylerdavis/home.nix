{ ... }: 
{
  programs.awscli = {
    enable = true;
    settings = {
      default = {
        sso_session = "general_sso";
        sso_account_id = "569779214408";
        sso_role_name = "Engineer";
        region = "us-east-1";
        output = "json";
      };
      "profile sandbox" = {
        sso_session = "general_sso";
        sso_account_id = "569779214408";
        sso_role_name = "Engineer";
        region = "us-east-1";
        output = "json";
      };
      "profile staging" = {
        sso_session = "general_sso";
        sso_account_id = "734569489806";
        sso_role_name = "Engineer";
        region = "us-east-1";
        output = "json";
      };
      "profile infrastructure" = {
        sso_session = "general_sso";
        sso_account_id = "732508301558";
        sso_role_name = "Engineer";
        region = "us-east-1";
        output = "json";
      };
      "profile nexus-staging" = {
        sso_session = "general_sso";
        sso_account_id = "905418421770";
        sso_role_name = "Engineer";
        region = "us-east-1";
        output = "json";
      };
      "sso-session general_sso" = {
        sso_start_url = "https://launchnotes.awsapps.com/start";
        sso_region = "us-east-1";
        sso_registration_scopes = "sso:account:access";
      };
      "profile production" = {
        sso_session = "prod_sso";
        sso_account_id = "375202058133";
        sso_role_name = "Engineer";
        region = "us-east-1";
        output = "json";
      };
      "profile nexus-production" = {
        sso_session = "prod_sso";
        sso_account_id = "381492026895";
        sso_role_name = "Engineer";
        region = "us-east-1";
        output = "json";
      };
      "profile prod_sso" = {
        sso_start_url = "https://launchnotes.awsapps.com/start";
        sso_region = "us-east-1";
        sso_registration_scopes = "sso:account:access";
      };
    };
  };
}
