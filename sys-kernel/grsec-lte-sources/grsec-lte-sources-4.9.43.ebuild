# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

ETYPE="sources"

inherit kernel-2
detect_version
detect_arch

KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
HOMEPAGE="https://dev.gentoo.org/~mpagano/genpatches"

HGPV_URI="https://github.com/minipli/linux-unofficial_grsec/releases/download/v4.9.43-unofficial_grsec/v4.9.43-unofficial_grsec-20170813161148.diff"
UNIPATCH_LIST="${DISTDIR}/v4.9.43-unofficial_grsec-20170813161148.diff"

DESCRIPTION="Full sources including the Gentoo patchset for the ${KV_MAJOR}.${KV_MINOR} kernel tree"
SRC_URI="${KERNEL_URI} ${HGPV_URI}"

pkg_postinst() {
    kernel-2_pkg_postinst
    einfo "For more info on this patchset, and how to report problems, see:"
    einfo "${HOMEPAGE}"
}

pkg_postrm() {
    kernel-2_pkg_postrm
}

