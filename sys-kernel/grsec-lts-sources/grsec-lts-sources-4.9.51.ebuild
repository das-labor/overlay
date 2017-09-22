# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

ETYPE="sources"

inherit kernel-2
detect_version
detect_arch

KEYWORDS="x86 amd64"
HOMEPAGE="https://github.com/minipli/linux-unofficial_grsec"

HGPV_URI="https://github.com/minipli/linux-unofficial_grsec/releases/download/v4.9.51-unofficial_grsec/v4.9.51-unofficial_grsec-20170920220439.diff"
UNIPATCH_LIST="${DISTDIR}/v4.9.51-unofficial_grsec-20170920220439.diff"

DESCRIPTION="Full sources including of the kernel tree ${KV_MAJOR}.${KV_MINOR} with GRSecurity patchset of the lastest public available version"
SRC_URI="${KERNEL_URI} ${HGPV_URI}"

pkg_postinst() {
    kernel-2_pkg_postinst
    einfo "For more info on this patchset, and how to report problems, see:"
    einfo "${HOMEPAGE}"
}

pkg_postrm() {
    kernel-2_pkg_postrm
}

