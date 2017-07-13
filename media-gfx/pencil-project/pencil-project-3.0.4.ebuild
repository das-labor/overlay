# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit pax-utils

DESCRIPTION="An open-source GUI prototyping tool that's available for ALL platforms."
HOMEPAGE="http://pencil.evolus.vn/"
SRC_URI="http://pencil.evolus.vn/dl/V${PV}/Pencil-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S=${WORKDIR}

src_install() {
    cp -a . "${D}/opt" || die
    pax-mark rm "${ED}/opt/Pencil-${PV}"
	dosym /opt/Pencil-${PV}/pencil /usr/bin/pencil
}
