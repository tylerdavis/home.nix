final: prev: {
  pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
    (python-final: python-prev: {
      llm-claude-3 = python-final.buildPythonPackage rec {
        pname = "llm-claude-3";
        version = "0.1.0";
        format = "pyproject";

        src = python-final.fetchPypi {
          inherit pname version;
          sha256 = "5a792b74102454e7ba62c97b661f9836e7ab2511a6bb9821e0769a921efb0ad3";
        };

        nativeBuildInputs = with python-final; [
          poetry-core
        ];

        propagatedBuildInputs = with python-final; [
          llm
          click
          httpx
        ];

        meta = {
          description = "Claude 3 plugin for LLM";
          homepage = "https://github.com/simonw/llm-claude-3";
        };
      };
    })
  ];
}
