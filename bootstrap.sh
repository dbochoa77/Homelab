#!/usr/bin/env bash
set -Eeuo pipefail

# ------------------------------------------------------------------------------
# Bootstrap a NixOS machine from a flake inside this repo.
#
# Usage:
#   ./bootstrap.sh                             # defaults to nixosBase#nixos
#   ./bootstrap.sh --flake-dir nixosBase --attr nixos
#   ./bootstrap.sh --flake-dir pieDelta  --attr pieDelta
#   ./bootstrap.sh --skip-hw                 # don't copy hardware-configuration.nix
#
# Env vars (overrideable by flags):
#   FLAKE_DIR   default: nixosBase
#   FLAKE_ATTR  default: nixos
# ------------------------------------------------------------------------------

FLAKE_DIR="${FLAKE_DIR:-nixosBase}"
FLAKE_ATTR="${FLAKE_ATTR:-nixos}"
SKIP_HW=0

usage() {
  cat <<EOF
Usage: $0 [--flake-dir <path>] [--attr <attr>] [--skip-hw]

Options:
  --flake-dir  Path to the directory containing flake.nix (default: ${FLAKE_DIR})
  --attr       Flake attribute (system/home name) to build (default: ${FLAKE_ATTR})
  --skip-hw    Do not copy /etc/nixos/hardware-configuration.nix into the flake

Examples:
  $0
  $0 --flake-dir nixosBase --attr nixos
  $0 --flake-dir pieDelta  --attr pieDelta
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --flake-dir) FLAKE_DIR="$2"; shift 2 ;;
    --attr)      FLAKE_ATTR="$2"; shift 2 ;;
    --skip-hw)   SKIP_HW=1; shift ;;
    -h|--help)   usage; exit 0 ;;
    *) echo "Unknown option: $1"; usage; exit 1 ;;
  esac
done

# Resolve repo root (handles running the script from anywhere inside the repo)
if ! command -v git >/dev/null 2>&1; then
  echo "git is required. Install it first (e.g., nix profile install nixpkgs#git)." >&2
  exit 1
fi

REPO_ROOT="$(git rev-parse --show-toplevel)"
cd "$REPO_ROOT"

# Ensure flake directory exists and has a flake.nix
if [[ ! -d "$FLAKE_DIR" || ! -f "$FLAKE_DIR/flake.nix" ]]; then
  echo "ERROR: '$FLAKE_DIR' does not exist or has no flake.nix." >&2
  exit 1
fi

# Copy hardware configuration into the expected host folder when present.
# Convention: <flake-dir>/hosts/<attr>/hardware-configuration.nix
# This matches your nixosBase layout: hosts/nixos/hardware-configuration.nix
if [[ $SKIP_HW -eq 0 ]]; then
  SRC_HW="/etc/nixos/hardware-configuration.nix"
  DEST_DIR="$FLAKE_DIR/hosts/$FLAKE_ATTR"
  DEST_HW="$DEST_DIR/hardware-configuration.nix"

  if [[ -f "$SRC_HW" ]]; then
    mkdir -p "$DEST_DIR"
    # Backup existing file if present
    if [[ -f "$DEST_HW" ]]; then
      cp -f "$DEST_HW" "${DEST_HW}.bak.$(date +%Y%m%d-%H%M%S)"
    fi
    sudo cp "$SRC_HW" "$DEST_HW"
    echo "✓ Copied hardware config to $DEST_HW"
  else
    echo "⚠️  $SRC_HW not found; skipping hardware copy."
  fi
else
  echo "↷ Skipping hardware-configuration copy by request."
fi

# Quick flake check (fail fast with a clear error if flake is broken)
echo "▶ Validating flake: $FLAKE_DIR"
nix flake check "$FLAKE_DIR" || {
  echo "❌ nix flake check failed. Fix errors above and re-run." >&2
  exit 1
}

# Rebuild NixOS
echo "▶ nixos-rebuild switch --flake ${FLAKE_DIR}#${FLAKE_ATTR}"
sudo nixos-rebuild switch --flake "${FLAKE_DIR}#${FLAKE_ATTR}"

# Home Manager (run as user, not sudo)
# Only attempt when the homeConfigurations attr likely exists.
echo "▶ home-manager switch --flake ${FLAKE_DIR}#${FLAKE_ATTR} (if available)"
if command -v home-manager >/dev/null 2>&1; then
  # Try; don't hard fail if the home attr is not defined for this target
  if home-manager switch --flake "${FLAKE_DIR}#${FLAKE_ATTR}"; then
    echo "✓ Home Manager applied."
  else
    echo "ℹ️  Home Manager didn't apply for attr '${FLAKE_ATTR}'. (This is fine if HM isn't defined for this target.)"
  fi
else
  echo "ℹ️  home-manager not found in PATH; skipping."
fi

echo "✅ Done. System and (optionally) Home were switched to ${FLAKE_DIR}#${FLAKE_ATTR}"

