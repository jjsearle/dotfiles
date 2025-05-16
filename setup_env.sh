#!/usr/bin/env bash

mkdir -p $HOME/.config
ln -s $PWD/.config/nvim/ $HOME/.config/nvim
ln -s $PWD/.bashrc $HOME/.bashrc
ln -s $PWD/.bashrc.d/ $HOME/.bashrc.d
ln -s $PWD/.tmux.conf $HOME/.tmux.conf

# Load OS information
if [ -f /etc/os-release ]; then
    source /etc/os-release
else
    echo "Cannot determine the distribution (no /etc/os-release found)."
    exit 1
fi

# Define package lists per distro
DEBIAN_PACKAGES=(git make gcc unzip neovim fd-find zoxide ripgrep fzf)
RHEL_PACKAGES=(git make gcc unzip neovim fd-find zoxide ripgrep fzf)

echo "Detected distribution: $ID"

case "$ID" in
    ubuntu|debian)
        echo "Installing packages for Debian/Ubuntu..."
        sudo apt update && sudo apt install -y "${DEBIAN_PACKAGES[@]}"
        ;;
    rhel|centos|fedora|rocky)
        echo "Installing packages for RHEL-based distributions..."
        sudo dnf install -y "${RHEL_PACKAGES[@]}"
        ;;
    *)
        echo "Unsupported distribution: $ID"
        exit 2
        ;;
esac
