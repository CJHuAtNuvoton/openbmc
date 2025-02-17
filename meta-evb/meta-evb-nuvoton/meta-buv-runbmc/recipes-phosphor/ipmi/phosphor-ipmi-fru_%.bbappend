inherit obmc-phosphor-systemd

FILESEXTRAPATHS_prepend_buv-runbmc := "${THISDIR}/${PN}:"

DEPENDS_append_buv-runbmc = " buv-runbmc-yaml-config"

EXTRA_OECONF_buv-runbmc = " \
    YAML_GEN=${STAGING_DIR_HOST}${datadir}/buv-runbmc-yaml-config/ipmi-fru-read.yaml \
    PROP_YAML=${STAGING_DIR_HOST}${datadir}/buv-runbmc-yaml-config/ipmi-extra-properties.yaml \
    "

EEPROM_NAMES = "bmc"

EEPROMFMT = "system/chassis/{0}"
EEPROM_ESCAPEDFMT = "system-chassis-{0}"
EEPROMS = "${@compose_list(d, 'EEPROMFMT', 'EEPROM_NAMES')}"
EEPROMS_ESCAPED = "${@compose_list(d, 'EEPROM_ESCAPEDFMT', 'EEPROM_NAMES')}"

ENVFMT = "obmc/eeproms/{0}"
SYSTEMD_ENVIRONMENT_FILE_${PN}_append_buv-runbmc := " ${@compose_list(d, 'ENVFMT', 'EEPROMS')}"

TMPL = "obmc-read-eeprom@.service"
TGT = "${SYSTEMD_DEFAULT_TARGET}"
INSTFMT = "obmc-read-eeprom@{0}.service"
FMT = "../${TMPL}:${TGT}.wants/${INSTFMT}"

SYSTEMD_LINK_${PN}_append_buv-runbmc := " ${@compose_list(d, 'FMT', 'EEPROMS_ESCAPED')}"
