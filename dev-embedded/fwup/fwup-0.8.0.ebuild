# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit autotools

DESCRIPTION="Configurable embedded Linux firmware update creator and runner."
HOMEPAGE="https://github.com/fhunleth/fwup"
SRC_URI="https://github.com/fhunleth/${PN}/tarball/v${PV} -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-libs/confuse-2.8
		app-arch/libarchive
		dev-libs/libsodium"
RDEPEND="${DEPEND}"

S="${WORKDIR}/fhunleth-fwup-c57d12f"

src_prepare() {
	eautoreconf
	default
}

src_install() {
	default
	
	insinto /etc
	doins fwupdate.conf
}
