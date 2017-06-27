# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit qmake-utils

DESCRIPTION="This is a QML Plugin that provides access to a Python 3 interpreter from QML."
HOMEPAGE="http://thp.io/2011/pyotherside/"
SRC_URI="https://github.com/thp/${PN}/archive/${PV}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-qt/qtcore:5
		>=dev-lang/python-3.4.5"
RDEPEND="${DEPEND}"

src_configure() {
	eqmake5 pyotherside.pro
}

src_install() {
	emake install INSTALL_ROOT="${D}"
}
