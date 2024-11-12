# shellcheck shell=ash

case "${ARCH}" in
  "arm64")
    mv "${MODPATH}/python/arm64/usr" "${MODPATH}"
    ;;
  "arm")
    mv "${MODPATH}/python/arm/usr" "${MODPATH}"
    ;;
  *)
    abort "! Your device architecture is not supported"
    ;;
esac

mv "${MODPATH}/python/stdlib/"* "${MODPATH}"

set_perm_recursive "${MODPATH}/system/bin" 0 0 0755 0744
set_perm_recursive "${MODPATH}/usr/bin" 0 0 0755 0744

mkdir "${MODPATH}/usr/tmp"

rm -rf "${MODPATH}/CHANGELOG.md" \
  "${MODPATH}/LICENCE" \
  "${MODPATH}/README.md" \
  "${MODPATH}/python"
