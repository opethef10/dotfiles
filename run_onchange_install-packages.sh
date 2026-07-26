#!/usr/bin/env bash
set -eufo pipefail

if [ -n "${TERMUX_VERSION:-}" ]; then
  echo "This script does not support Termux. Aborting." >&2
  exit 1
fi

sudo apt update
sudo apt install -y build-essential eza tmux bat fd-find ripgrep ncdu python3-pip

# batcat/fdfind are named differently on Debian/Ubuntu; symlink to expected names
mkdir -p ~/.local/bin
[ -e ~/.local/bin/bat ] || ln -s "$(command -v batcat)" ~/.local/bin/bat
[ -e ~/.local/bin/fd ] || ln -s "$(command -v fdfind)" ~/.local/bin/fd

# --- neovim (static tarball — no FUSE dependency like the appimage had) ---
if ! command -v nvim >/dev/null 2>&1; then
  TMP_DIR=$(mktemp -d)
  curl -Lo "$TMP_DIR/nvim.tar.gz" \
    https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
  tar xzf "$TMP_DIR/nvim.tar.gz" -C "$TMP_DIR"
  mkdir -p ~/.local/opt
  rm -rf ~/.local/opt/nvim
  mv "$TMP_DIR"/nvim-linux-x86_64 ~/.local/opt/nvim
  ln -sf ~/.local/opt/nvim/bin/nvim ~/.local/bin/nvim
  rm -rf "$TMP_DIR"
fi

# --- opencode ---
if ! command -v opencode >/dev/null 2>&1; then
  curl -fsSL https://opencode.ai/install | bash
fi

# --- pureline ---
if [ ! -d ~/kod/clones/pureline ]; then
  git clone https://github.com/chris-marsh/pureline.git ~/kod/clones/pureline
fi

# --- lazydocker ---
if ! command -v lazydocker >/dev/null 2>&1; then
  curl -fsSL https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
fi

# --- lazygit ---
if ! command -v lazygit >/dev/null 2>&1; then
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": *"v\K[^"]*')
  LAZYGIT_ARCH=$(uname -m | sed -e 's/aarch64/arm64/')
  TMP_DIR=$(mktemp -d)
  curl -Lo "$TMP_DIR/lazygit.tar.gz" "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_${LAZYGIT_ARCH}.tar.gz"
  tar xf "$TMP_DIR/lazygit.tar.gz" -C "$TMP_DIR" lazygit
  sudo install "$TMP_DIR/lazygit" -D -t /usr/local/bin/
  rm -rf "$TMP_DIR"
fi

# --- fzf ---
FZF_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/fzf"
if [ ! -d "$FZF_DIR" ]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git "$FZF_DIR"
  "$FZF_DIR/install" --all --xdg
fi

# --- uv / uvx ---
if ! command -v uv >/dev/null 2>&1; then
  curl -LsSf https://astral.sh/uv/install.sh | sh
fi

# --- yazi (ya, yazi) ---
if ! command -v yazi >/dev/null 2>&1; then
  TMP_DIR=$(mktemp -d)
  curl -Lo "$TMP_DIR/yazi.zip" \
    https://github.com/sxyazi/yazi/releases/latest/download/yazi-x86_64-unknown-linux-gnu.zip
  unzip -q "$TMP_DIR/yazi.zip" -d "$TMP_DIR"
  find "$TMP_DIR" -maxdepth 2 -type f \( -name yazi -o -name ya \) -exec cp {} ~/.local/bin/ \;
  chmod +x ~/.local/bin/yazi ~/.local/bin/ya
  rm -rf "$TMP_DIR"
fi

# --- yt-dlp ---
if ! command -v yt-dlp >/dev/null 2>&1; then
  curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o ~/.local/bin/yt-dlp
  chmod +x ~/.local/bin/yt-dlp
fi

# --- diff-so-fancy (via npm, since nvm/npm already set up) ---
if ! command -v diff-so-fancy >/dev/null 2>&1; then
  npm install -g diff-so-fancy
fi

# --- diff-highlight (ships inside git's contrib, just needs symlinking) ---
if [ ! -e ~/.local/bin/diff-highlight ]; then
  GIT_CONTRIB="/usr/share/doc/git/contrib/diff-highlight/diff-highlight"
  if [ -e "$GIT_CONTRIB" ]; then
    chmod +x "$GIT_CONTRIB" 2>/dev/null || true
    ln -s "$GIT_CONTRIB" ~/.local/bin/diff-highlight
  fi
fi

# --- difftastic (difft) ---
if ! command -v difft >/dev/null 2>&1; then
  TMP_DIR=$(mktemp -d)
  DIFFT_VERSION=$(curl -s "https://api.github.com/repos/Wilfred/difftastic/releases/latest" | grep -Po '"tag_name": *"\K[^"]*')
  curl -Lo "$TMP_DIR/difft.tar.gz" \
    "https://github.com/Wilfred/difftastic/releases/download/${DIFFT_VERSION}/difft-x86_64-unknown-linux-gnu.tar.gz"
  tar xf "$TMP_DIR/difft.tar.gz" -C "$TMP_DIR"
  cp "$TMP_DIR/difft" ~/.local/bin/
  chmod +x ~/.local/bin/difft
  rm -rf "$TMP_DIR"
fi

# --- localias (requires Go, which is already manually installed at /usr/local/go) ---
if ! command -v localias >/dev/null 2>&1 && command -v go >/dev/null 2>&1; then
  go install github.com/peterldowns/localias/cmd/localias@latest
fi

# TODO: the following don't have a confirmed install source yet —
# fill in once you know where each came from originally:
#   gitlogue, lazysql, lazyssh, tclip, sanitizefs, party.py,
#   open / wsl-open / xdg-open

# --- gitflow ---
if ! command -v git-flow >/dev/null 2>&1; then
  TMP_DIR=$(mktemp -d)
  curl -fsSL -o "$TMP_DIR/gitflow-installer.sh" \
    https://raw.githubusercontent.com/nvie/gitflow/develop/contrib/gitflow-installer.sh
  chmod +x "$TMP_DIR/gitflow-installer.sh"
  sudo "$TMP_DIR/gitflow-installer.sh"
  rm -rf "$TMP_DIR"
fi

# --- personal repo clone ---
if [ ! -d ~/kod/clones/Hetzner-Zero-Trust-VPS ]; then
  mkdir -p ~/kod/clones
  git clone https://github.com/marton-harangi/Hetzner-Zero-Trust-VPS.git ~/kod/clones/Hetzner-Zero-Trust-VPS
  chmod +x ~/kod/clones/Hetzner-Zero-Trust-VPS/*.sh
fi

# --- powerline (pip) ---
pip install --user --break-system-packages "git+https://github.com/powerline/powerline"
