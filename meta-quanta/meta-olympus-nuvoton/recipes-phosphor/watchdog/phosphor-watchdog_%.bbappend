FILESEXTRAPATHS_prepend_olympus-nuvoton := "${THISDIR}/${PN}:"

SRC_URI_append_olympus-nuvoton = " file://0001-Customize-phosphor-watchdog-for-Intel-platforms.patch"
SRC_URI_append_olympus-nuvoton = " file://0002-create-a-dbus-log-entry-when-watchdog-timeout-occurs.patch"

# Remove the override to keep service running after DC cycle
SYSTEMD_OVERRIDE_${PN}_remove_olympus-nuvoton = "poweron.conf:phosphor-watchdog@poweron.service.d/poweron.conf"
SYSTEMD_SERVICE_${PN}_olympus-nuvoton = "phosphor-watchdog.service"

