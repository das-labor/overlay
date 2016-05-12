# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="A better WeChat on Mac OS X and Linux. Fewer bugs, more features. Build with Electron."
HOMEPAGE="https://github.com/geeeeeeeeek/electronic-wechat"
SRC_URI="https://github.com/geeeeeeeeek/electronic-wechat/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MiT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-util/electron
	net-libs/nodejs[npm]"
RDEPEND="${DEPEND}"

src_compile() {
	NPM_CONFIG_NODEDIR=/usr/include/electron/node \
	npm install || die
}

src_install() {
	dodir /usr/lib/electronic-wechat
	insinto /usr/lib/electronic-wechat
	doins package.json
	doins config.json
	doins -r assets
	cp -a node_modules "${ED}/usr/lib/electronic-wechat"
	insinto /usr/bin
	doexe "${FILESDIR}/wechat"
}
