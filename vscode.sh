#!/usr/bin/env bash

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
echo "⚙️ Starting VSode:"
code --extensions-dir=".vscode-extensions" .
