let
  pinnedHash = "933d7dc155096e7575d207be6fb7792bc9f34f6d"; 
  pinnedPkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/${pinnedHash}.tar.gz") { };
  pythonPackages = pinnedPkgs.python3Packages;
in pinnedPkgs.mkShell rec {
  name = "impurePythonEnv";
  venvDir = "./.venv";
  buildInputs = [
    # A Python interpreter including the 'venv' module is required to bootstrap
    # the environment.
    pythonPackages.python
    # This executes some shell code to initialize a venv in $venvDir before
    pythonPackages.venvShellHook
    pythonPackages.requests
    pinnedPkgs.git
  ];
  

  #
  # ⚠️  Note: Do not use shellHook here too - it will prevent postVenvCreation 
  #          from running. Also use the ./clean script if you change the 
  #          postVenvCreation procedure below.
  #

  # Run this command, only after creating the virtual environment
  postVenvCreation = ''
     unset SOURCE_DATE_EPOCH
     echo "🐍 Installing Python Dependencies."
     pip install -r requirements.txt
     echo "🐏 Cloning pyogctest."
     git clone https://github.com/pblottiere/pyogctest
     echo "⚙️  Installing pyogctest."
     pip install -e pyogctest/
     echo "🧊 Verifying python packages with pip freeze"
     pip freeze 
     echo "🎒 Fetching data pack for OGC Tests"
     python pyogctest/pyogctest.py -s wms130 --download
  '';

  # Now we can execute any commands within the virtual environment.
  # This is optional and can be left out to run pip manually.
  postShellHook = ''
    # allow pip to install wheels
    unset SOURCE_DATE_EPOCH
  '';
}

