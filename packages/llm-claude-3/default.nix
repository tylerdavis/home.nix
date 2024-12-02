{ lib
, python3
, fetchFromGitHub
}:

python3.pkgs.buildPythonPackage rec {
  pname = "llm-claude-3";
  version = "0.1.0";  # Replace with the actual version

  src = fetchFromGitHub {
    owner = "simonw";
    repo = pname;
    rev = version;
    sha256 = "88ca21441607641d154dae49e24d0140a95418bb441a207bc78e5aca89764d02";
  };

  propagatedBuildInputs = with python3.pkgs; [
    llm
    anthropic
  ];

  doCheck = false;

  meta = with lib; {
    description = "LLM plugin for Claude 3 models";
    homepage = "https://github.com/simonw/llm-claude-3";
    license = licenses.asl20;
    maintainers = [ ];
  };
}
