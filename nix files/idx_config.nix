{ pkgs, ... }: {
  channel = "stable-23.11";
  services.docker.enable = true;

  packages = with pkgs; [
    python311
    python311Packages.autopep8
    python311Packages.pip
    python311Packages.streamlit
    python311Packages.plotly
    python311Packages.pandas
  ];


  env = {
    # Define theme environment variables here (optional)
  };

  idx = {
    extensions = [
      "ms-toolsai.jupyter"
      "ms-python.python"
      "mhutchie.git-graph"
      "zhuangtongfa.material-theme"
      "ms-azuretools.vscode-docker"
    ];
    workspace = {
      onCreate = {
        create-venv = ''
          python -m venv .venv
          source .venv/bin/activate
          pip install -r requirements.txt
        '';
      };

    };
    previews = {
    };
  };
}

