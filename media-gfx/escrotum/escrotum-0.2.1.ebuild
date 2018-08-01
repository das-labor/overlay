# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=(python2_7)

inherit distutils-r1

DESCRIPTION="Linux screen capture using pygtk inspired by scrot"
HOMEPAGE="https://github.com/Roger/escrotum"
SRC_URI="https://github.com/Roger/escrotum/archive/${PV}.tar.gz -> ${P}.tar.gz"
SLOT="0"

LICENSE="GPL3"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
DEPEND="dev-python/pygtk:2[${PYTHON_USEDEP}]"
