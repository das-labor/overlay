# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="https://zoom.us/"
HOMEPAGE="Zoom client for Linux"
SRC_URI="https://zoom.us/client/${PV}/zoom_x86_64.tar.xz -> zoom-${PV}_x86_64.tar.xz"

LICENSE="UNLICENSED"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"


src_compile() {
	echo "Nothing to compile :)"
}

src_install() {
	exeinto /usr/bin
	doexe zoom/zoom
}
