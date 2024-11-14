# shellcheck shell=ash

case "${ARCH}" in
  "arm64")
    tar -xf "${MODPATH}/python/arm64.tar.xz" -C "${MODPATH}" \
      --strip-components 1
    ;;
  "arm")
    tar -xf "${MODPATH}/python/arm.tar.xz" -C "${MODPATH}" \
      --strip-components 1
    ;;
  *)
    abort "! Your device architecture is not supported"
    ;;
esac

tar -xf "${MODPATH}/python/stdlib.tar.xz" -C "${MODPATH}" \
  --strip-components 1

set_perm_recursive "${MODPATH}/system/bin" 0 0 0755 0744
set_perm_recursive "${MODPATH}/usr/bin" 0 0 0755 0744
set_perm_recursive "${MODPATH}/usr/lib" 0 0 0755 0644

mkdir "${MODPATH}/usr/tmp"

rm -rf "${MODPATH}/CHANGELOG.md" \
  "${MODPATH}/LICENCE" \
  "${MODPATH}/README.md" \
  "${MODPATH}/python"
