# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_4 python3_5 python3_6 )
inherit distutils-r1

DESCRIPTION="Styled Terminal Markdown Viewer"
HOMEPAGE="https://github.com/axiros/terminal_markdown_viewer"
SRC_URI="mirror://pypi/m/${PN}/${P}.tar.gz"
PATCHES=(
	"${FILESDIR}/python3.patch"
)

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="
	${DEPEND}
	dev-python/markdown[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
	dev-python/docopt[${PYTHON_USEDEP}]

"
