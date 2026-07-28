#!/usr/bin/env bash

mkdir -p ~/.local/bin
mkdir -p ~/kod/clones

sudo apt update
sudo apt upgrade -y
sudo apt install build-essential -y
sudo apt install eza -y
sudo apt install tmux -y

# Install neovim
if ! command -v nvim &>/dev/null; then
  echo "Installing neovim..."
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
  tar xzf nvim-linux-x86_64.tar.gz -C "$TMPDIR"
  mv -f "$TMPDIR/nvim-linux-x86_64/bin/nvim" ~/.local/bin/nvim
  rm -rf "$TMPDIR/nvim-linux-x86_64" nvim-linux-x86_64.tar.gz
  echo "neovim installed"
else
  echo "nvim already installed, skipping"
fi

# Starship
echo "Installing Starship..."
curl -sS https://starship.rs/install.sh | bash

# Lazydocker
echo "Installing/updating lazydocker..."
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

# Lazygit
if ! command -v lazygit &>/dev/null; then
  echo "Installing lazygit..."
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
  LAZYGIT_ARCH=$(uname -m | sed -e 's/aarch64/arm64/')
  curl -Lo "$TMPDIR/lazygit.tar.gz" "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_${LAZYGIT_ARCH}.tar.gz"
  tar xf "$TMPDIR/lazygit.tar.gz" -C "$TMPDIR"
  mv -f "$TMPDIR/lazygit" ~/.local/bin/lazygit
  rm "$TMPDIR/lazygit.tar.gz"
  echo "lazygit installed"
else
  echo "lazygit already installed, skipping"
fi

# Fzf
if [ -d "$XDG_DATA_HOME/fzf" ]; then
  echo "Updating fzf..."
  git -C "$XDG_DATA_HOME/fzf" pull
else
  echo "Cloning fzf..."
  git clone --depth 1 https://github.com/junegunn/fzf.git "$XDG_DATA_HOME/fzf"
fi
echo "Installing fzf..."
"$XDG_DATA_HOME/fzf/install" --xdg --all --no-update-rc

# Git Flow
if ! command -v git-flow &>/dev/null; then
  echo "Installing git-flow..."
  curl -OL https://raw.github.com/nvie/gitflow/develop/contrib/gitflow-installer.sh
  chmod +x gitflow-installer.sh
  sudo ./gitflow-installer.sh
  rm -f gitflow-installer.sh
  echo "git-flow installed"
else
  echo "git-flow already installed, skipping"
fi

# Hetzner-Zero-Trust-VPS
if [ -d ~/kod/clones/Hetzner-Zero-Trust-VPS ]; then
  echo "Updating Hetzner-Zero-Trust-VPS..."
  git -C ~/kod/clones/Hetzner-Zero-Trust-VPS pull
else
  echo "Cloning Hetzner-Zero-Trust-VPS..."
  git clone https://github.com/marton-harangi/Hetzner-Zero-Trust-VPS.git ~/kod/clones
fi
chmod +x ~/kod/clones/Hetzner-Zero-Trust-VPS/*.sh

# bat
sudo apt install bat -y
ln -sf /usr/bin/batcat ~/.local/bin/bat

# fd
sudo apt install fd-find -y
ln -sf "$(which fdfind)" ~/.local/bin/fd

sudo apt-get install ripgrep -y
sudo apt install fastfetch -y
sudo apt install ncdu -y
sudo apt install python3-pip -y

curl -fsSL https://opencode.ai/install | bash
