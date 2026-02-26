#!/usr/bin/env bash
set -euo pipefail

### 1) Ensure Rust/Cargo is installed
if ! command -v rustc >/dev/null 2>&1; then
    echo "⚙️ Rust not found — installing..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    # Load Cargo in current session
    source "$HOME/.cargo/env"
else
    echo "✅ Rust is already installed"
    # Ensure Cargo is loaded
    if [ -f "$HOME/.cargo/env" ]; then
        source "$HOME/.cargo/env"
    fi
fi


### 2) Determine latest remote version (GitHub)
remote_latest=$(curl -s https://api.github.com/repos/zellij-org/zellij/releases/latest \
    | grep -Po '"tag_name": *"\K.*?(?=")' )
echo "🌐 Latest remote Zellij version: $remote_latest"

### 3) Get installed version (if any)
installed_version=""
if command -v zellij >/dev/null 2>&1; then
    installed_version=$(zellij --version | awk '{print $NF}')
    echo "💿 Installed Zellij version: $installed_version"
else
    echo "⚠️ Zellij not currently installed"
fi

### 4) Install/upgrade if needed
if [[ "$installed_version" != "$remote_latest" ]]; then
    echo "⬆️ Installing/upgrading Zellij to $remote_latest..."
    cargo install zellij --locked
else
    echo "✔️ Zellij is already up to date"
fi

echo "🎉 Done. Current Zellij version: $(zellij --version)"

