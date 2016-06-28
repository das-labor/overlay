# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit linux-mod systemd

DESCRIPTION="WireGuard is an extremely simple yet fast and modern VPN that utilizes state-of-the-art cryptography."
HOMEPAGE="https://www.wireguard.io/"

if [[ ${PV} == 9999 ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://git.zx2c4.com/WireGuard"
	KEYWORDS=""
else
	SRC_URI=""
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE="+tools"
RESTRICT="userpriv"

DEPEND="net-libs/libmnl"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-${PV}/src"

pkg_setup() {
	linux-mod_pkg_setup
	MODULE_NAMES="wireguard(net:)"
	BUILD_PARAMS="KSRC=${KV_DIR} KBUILD=${KV_OUT_DIR}"
}

src_compile() {
	 linux-mod_src_compile

	 if use tools ; then
		emake -C "${S}"/tools
	 fi
}

src_install() {
	linux-mod_src_install
	dodoc "${WORKDIR}/${PN}-${PV}"/README.md

	dodir /usr/share/wireguard
	insinto /usr/share/wireguard
	doins -r "${WORKDIR}/${PN}-${PV}"/contrib/client-server-example

	systemd_dounit "${WORKDIR}/${PN}-${PV}"/contrib/wgserver.service

	if use tools ; then
		doman "${WORKDIR}/${PN}-${PV}"/src/tools/wg.8
		dobin "${WORKDIR}/${PN}-${PV}"/src/tools/wg
	fi
}
