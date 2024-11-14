# shellcheck shell=ash

PYDROID_DIR="/data/local/pydroid"

[ -d "${PYDROID_DIR}" ] &&
  rm -rf "${PYDROID_DIR}"
