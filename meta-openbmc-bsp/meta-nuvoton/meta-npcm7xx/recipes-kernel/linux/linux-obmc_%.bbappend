FILESEXTRAPATHS_prepend_npcm7xx := "${THISDIR}/${PN}:"
KBRANCH = "Poleg-4.13.05-OpenBMC"
SRCREV = "Poleg-4.13.05-OpenBMC-20180522"
KSRC = "git://github.com/Nuvoton-Israel/linux;protocol=git;branch=${KBRANCH};"
SRC_URI_append_npcm7xx = " file://defconfig"
LINUX_VERSION = "4.13.5"
LINUX_VERSION_EXTENSION = "-nuvoton"
