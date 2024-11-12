# shellcheck shell=ash

if [ "${ARCH}" != "arm64" ]; then
  abort "! Your device architecture is not supported"
fi

set_perm_recursive "${MODPATH}/system/bin" 0 0 0755 0744
set_perm_recursive "${MODPATH}/usr/bin" 0 0 0755 0744

mkdir "${MODPATH}/usr/tmp"

rm "${MODPATH}/CHANGELOG.md" "${MODPATH}/LICENCE" "${MODPATH}/README.md"
