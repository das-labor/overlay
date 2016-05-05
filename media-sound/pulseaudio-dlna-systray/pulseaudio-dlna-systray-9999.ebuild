# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="System tray support for pulseaudio-dlna"
HOMEPAGE="https://github.com/queeup/pulseaudio-dlna-systray"

MY_AUTHOR="zaolin"
HOMEPAGE="https://github.com/${MY_AUTHOR}/${PN}"

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/${MY_AUTHOR}/${PN}.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/${MY_AUTHOR}/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE=""
SLOT="0"
IUSE=""

DEPEND="media-sound/pulseaudio-dlna"
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/bin
	dobin pulseaudio-dlna-systray

	dodir /usr/share/pulseaudio-dlna-systray
	insinto /usr/share/pulseaudio-dlna-systray
	doins icon.png
}
