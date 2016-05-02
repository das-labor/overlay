# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit golang-build pax-utils

EGO_PN=github.com/twstrike/${PN}

if [[ ${PV} = *9999* ]]; then
    inherit golang-vcs
else
    KEYWORDS="~amd64"
    SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
    inherit golang-vcs-snapshot
fi

DESCRIPTION="Secure orientated xmpp client written in go."
HOMEPAGE="https://github.com/twstrike/coyim"
LICENSE="GPL-3"
SLOT="0"
IUSE=""
DEPEND="x11-libs/gtk+:3"
RDEPEND=""

src_install() {
	insinto /usr/bin
	pax-mark m coyim
	dobin coyim 
}
