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
  # DIRENV_LOG_FORMAT to reduce direnv verbosity
  # See https://github.com/direnv/direnv/issues/68#issuecomment-162639262
  shellHook = ''
     export DIRENV_LOG_FORMAT=
     echo "-----------------------"
     echo "🌈 Your Hetzner Dev Environment is prepared."
     echo "Run ./menu.py to start the gui"
     echo ""
     echo "🪛 Installing VSCode Extensions:"
     echo "--------------------------------"
     code --extensions-dir=".vscode-extensions" --install-extension donjayamanne.python-environment-manager
     code --extensions-dir=".vscode-extensions" --install-extension donjayamanne.python-extension-pack
     code --extensions-dir=".vscode-extensions" --install-extension hbenl.vscode-test-explorer
     code --extensions-dir=".vscode-extensions" --install-extension jamesqquick.python-class-generator
     code --extensions-dir=".vscode-extensions" --install-extension KevinRose.vsc-python-indent
     code --extensions-dir=".vscode-extensions" --install-extension littlefoxteam.vscode-python-test-adapter
     code --extensions-dir=".vscode-extensions" --install-extension maziac.asm-code-lens
     code --extensions-dir=".vscode-extensions" --install-extension ms-python.debugpy
     code --extensions-dir=".vscode-extensions" --install-extension ms-python.python
     code --extensions-dir=".vscode-extensions" --install-extension ms-python.vscode-pylance
     code --extensions-dir=".vscode-extensions" --install-extension ms-vscode.test-adapter-converter
     code --extensions-dir=".vscode-extensions" --install-extension njpwerner.autodocstring
     code --extensions-dir=".vscode-extensions" --install-extension VisualStudioExptTeam.intellicode-api-usage-examples
     code --extensions-dir=".vscode-extensions" --install-extension VisualStudioExptTeam.vscodeintellicode
     echo ""
     echo "📒 Note:"
     echo "-----------------------"
     echo "start vscode like this:"
     echo ""
     echo "code --extensions-dir=\".vscode-extensions\" ."
     echo "-----------------------"
  '';
  # Run this command, only after creating the virtual environment
  postVenvCreation = ''
     unset SOURCE_DATE_EPOCH
     pip install -r requirements.txt
  '';


  # Now we can execute any commands within the virtual environment.
  # This is optional and can be left out to run pip manually.
  postShellHook = ''
    # allow pip to install wheels
    unset SOURCE_DATE_EPOCH
  '';
}

