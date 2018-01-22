# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGO_PN="github.com/jingweno/ccat"
inherit golang-build golang-vcs-snapshot

DESCRIPTION="Colorizing cat"
HOMEPAGE="https://github.com/jingweno/ccat"
SRC_URI="https://github.com/jingweno/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin ccat
	pushd src/${EGO_PN} || die
	dodoc -r README.md
	popd  || die
}
