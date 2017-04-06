# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils pax-utils

DESCRIPTION="The most intuitive cross-platform REST API Client"
HOMEPAGE="https://insomnia.rest/"
SRC_URI="https://downloads.insomnia.rest/linux/insomnia_${PV}_amd64.deb"
LICENSE="Insomnia"
RESTRICT="mirror"

SLOT="0"
KEYWORDS="~amd64 -*"
IUSE=""

QA_PREBUILT="usr/lib/slack/*"

DEPEND=""
RDEPEND="
	gnome-base/gconf
	x11-libs/libnotify
	dev-libs/libappindicator
	x11-libs/libXtst
	dev-libs/nss
"

S="${WORKDIR}"

src_unpack() {
	ar x "${DISTDIR}/${A}" || die
	unpack "${WORKDIR}/data.tar.xz"
}

src_prepare() {
	eapply_user
}

src_install() {
	cp -a usr opt "${D}" || die
	pax-mark rm "${ED}/opt/Insomnia/insomnia"
	dosym /opt/Insomnia/insomnia /usr/bin/insomnia
}
