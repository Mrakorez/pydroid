# shellcheck shell=ash

PYDROID_DIR="/data/local/pydroid"

link_files() {
  local target_dir="${MODPATH}/system/bin"

  cd "${target_dir}" ||
    abort "! Cannot cd to ${target_dir}"

  ln -s pydoc3.13 pydoc3
  ln -s python3.13-config python3-config
  ln -s python3.13 python3
}

[ -d "${PYDROID_DIR}" ] ||
  mkdir -p "${PYDROID_DIR}/.tmp"

case "${ARCH}" in
  "arm64")
    tar -xf "${MODPATH}/python/arm64.tar.xz" -C "${PYDROID_DIR}" \
      --strip-components 1
    ;;
  "arm")
    tar -xf "${MODPATH}/python/arm.tar.xz" -C "${PYDROID_DIR}" \
      --strip-components 1
    ;;
  *)
    rmdir -p "${PYDROID_DIR}/.tmp"
    abort "! Your device architecture is not supported"
    ;;
esac

tar -xf "${MODPATH}/python/stdlib.tar.xz" -C "${PYDROID_DIR}" \
  --strip-components 1

set_perm_recursive "${MODPATH}/system/bin" 0 0 0755 0744
set_perm_recursive "${PYDROID_DIR}/usr/bin" 0 0 0755 0744
set_perm_recursive "${PYDROID_DIR}/usr/lib" 0 0 0755 0644

link_files

rm -rf "${MODPATH}/CHANGELOG.md" \
  "${MODPATH}/LICENCE" \
  "${MODPATH}/README.md" \
  "${MODPATH}/python"
