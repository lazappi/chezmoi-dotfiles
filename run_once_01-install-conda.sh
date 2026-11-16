#!/bin/sh
# Install Miniforge in batch mode so the installer does not edit ~/.zshrc
# (conda and mamba are set up in dot_zshrc.tmpl)
set -eu
prefix="$HOME/miniforge3"
if [ -d "$prefix" ]; then
  echo "Miniforge already installed at $prefix, skipping"
  exit 0
fi
installer="Miniforge3-$(uname)-$(uname -m).sh"
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
curl -fsSL -o "$tmp/$installer" "https://github.com/conda-forge/miniforge/releases/latest/download/$installer"
bash "$tmp/$installer" -b -p "$prefix"
