#!/usr/bin/env bash
# Install modern CLI tools
# chezmoi re-runs this script when its content changes (run_once semantics)

set -euo pipefail

INSTALL_DIR="${HOME}/.local/bin"
mkdir -p "${INSTALL_DIR}"

OS="$(uname -s)"
ARCH="$(uname -m)"

log() { echo "==> $*"; }
installed() { command -v "$1" &>/dev/null; }

# ──────────────────────────────────────────────────────────
# Linux: install via dnf where available
# ──────────────────────────────────────────────────────────
if [[ "${OS}" == "Linux" ]] && command -v dnf &>/dev/null; then
  DNF_PKGS=()
  installed bat        || DNF_PKGS+=(bat)
  installed delta      || DNF_PKGS+=(git-delta)
  installed fd         || DNF_PKGS+=(fd-find)
  installed fzf        || DNF_PKGS+=(fzf)
  installed hyperfine  || DNF_PKGS+=(hyperfine)
  installed jq         || DNF_PKGS+=(jq)
  installed rg         || DNF_PKGS+=(ripgrep)
  installed zoxide     || DNF_PKGS+=(zoxide)

  if [[ ${#DNF_PKGS[@]} -gt 0 ]]; then
    log "dnf install: ${DNF_PKGS[*]}"
    sudo dnf install -y "${DNF_PKGS[@]}"
  fi
fi

# ──────────────────────────────────────────────────────────
# Helper: download & extract a GitHub release binary
# Usage: gh_install <binary_name> <repo> <version> <asset_url> [binary_in_archive]
# ──────────────────────────────────────────────────────────
gh_install() {
  local bin="$1" repo="$2" ver="$3" url="$4" bin_in_archive="${5:-}"
  if installed "${bin}"; then
    log "${bin} already installed, skipping"
    return
  fi
  log "Installing ${bin} (${ver}) from ${repo}"
  local tmp
  tmp="$(mktemp -d)"
  local filename="${url##*/}"
  curl -sL --max-time 120 -o "${tmp}/${filename}" "${url}"

  case "${filename}" in
    *.tar.gz|*.tgz)
      tar -xzf "${tmp}/${filename}" -C "${tmp}"
      ;;
    *.zip)
      unzip -q "${tmp}/${filename}" -d "${tmp}"
      ;;
    *)
      # bare binary
      cp "${tmp}/${filename}" "${INSTALL_DIR}/${bin}"
      chmod +x "${INSTALL_DIR}/${bin}"
      rm -rf "${tmp}"
      return
      ;;
  esac

  # find the binary inside the extracted archive
  local src
  if [[ -n "${bin_in_archive}" ]]; then
    src="$(find "${tmp}" -name "${bin_in_archive}" -type f | head -1)"
  else
    src="$(find "${tmp}" -name "${bin}" -type f | head -1)"
  fi

  if [[ -z "${src}" ]]; then
    echo "ERROR: could not find binary '${bin}' in ${filename}" >&2
    rm -rf "${tmp}"
    return 1
  fi

  cp "${src}" "${INSTALL_DIR}/${bin}"
  chmod +x "${INSTALL_DIR}/${bin}"
  rm -rf "${tmp}"
  log "${bin} installed to ${INSTALL_DIR}/${bin}"
}

# ──────────────────────────────────────────────────────────
# GitHub releases – Linux x86_64
# ──────────────────────────────────────────────────────────
if [[ "${OS}" == "Linux" && "${ARCH}" == "x86_64" ]]; then

  gh_install atuin   "atuinsh/atuin"          "v18.15.2" \
    "https://github.com/atuinsh/atuin/releases/download/v18.15.2/atuin-x86_64-unknown-linux-musl.tar.gz"

  gh_install btm     "ClementTsang/bottom"    "0.12.3" \
    "https://github.com/ClementTsang/bottom/releases/download/0.12.3/bottom_x86_64-unknown-linux-musl.tar.gz"

  gh_install dust    "bootandy/dust"          "v1.2.4" \
    "https://github.com/bootandy/dust/releases/download/v1.2.4/dust-v1.2.4-x86_64-unknown-linux-musl.tar.gz"

  gh_install eza     "eza-community/eza"      "v0.23.4" \
    "https://github.com/eza-community/eza/releases/download/v0.23.4/eza_x86_64-unknown-linux-musl.tar.gz"

  gh_install glow    "charmbracelet/glow"     "v2.1.2" \
    "https://github.com/charmbracelet/glow/releases/download/v2.1.2/glow_2.1.2_Linux_x86_64.tar.gz"

  gh_install lazygit "jesseduffield/lazygit"  "v0.61.1" \
    "https://github.com/jesseduffield/lazygit/releases/download/v0.61.1/lazygit_0.61.1_Linux_x86_64.tar.gz"

  # tealdeer: single binary, installed as 'tldr'
  if ! installed tldr; then
    log "Installing tldr (tealdeer v1.8.1)"
    curl -sL --max-time 60 \
      "https://github.com/dbrgn/tealdeer/releases/download/v1.8.1/tealdeer-linux-x86_64-musl" \
      -o "${INSTALL_DIR}/tldr"
    chmod +x "${INSTALL_DIR}/tldr"
    log "tldr installed to ${INSTALL_DIR}/tldr"
  else
    log "tldr already installed, skipping"
  fi

  # yazi: zip archive, contains yazi + ya binaries
  if ! installed yazi; then
    log "Installing yazi v26.1.22"
    tmp="$(mktemp -d)"
    curl -sL --max-time 120 \
      "https://github.com/sxyazi/yazi/releases/download/v26.1.22/yazi-x86_64-unknown-linux-musl.zip" \
      -o "${tmp}/yazi.zip"
    unzip -q "${tmp}/yazi.zip" -d "${tmp}"
    cp "$(find "${tmp}" -name "yazi" -type f | head -1)" "${INSTALL_DIR}/yazi"
    chmod +x "${INSTALL_DIR}/yazi"
    # install 'ya' helper if present
    ya_bin="$(find "${tmp}" -name "ya" -type f | head -1)"
    if [[ -n "${ya_bin}" ]]; then
      cp "${ya_bin}" "${INSTALL_DIR}/ya"
      chmod +x "${INSTALL_DIR}/ya"
    fi
    rm -rf "${tmp}"
    log "yazi installed to ${INSTALL_DIR}/yazi"
  else
    log "yazi already installed, skipping"
  fi

  gh_install zellij  "zellij-org/zellij"      "v0.44.1" \
    "https://github.com/zellij-org/zellij/releases/download/v0.44.1/zellij-x86_64-unknown-linux-musl.tar.gz"

fi

log "Done. Ensure ${INSTALL_DIR} is in your PATH."
