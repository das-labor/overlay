# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils git-r3

DESCRIPTION="A fast HEIF image converter aimed at thumbnailing"
EGIT_REPO_URI="https://github.com/monostream/tifig.git"
HOMEPAGE="https://github.com/monostream/tifig"
SRC_URI=""
EGIT_COMMIT="${PV}"

LICENSE="LGPL-2.1"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="0"

RDEPEND="
	media-video/ffmpeg
"

DEPEND="
	${RDEPEND}
	media-libs/vips
"

src_configure() {
	cmake-utils_src_configure
}

src_install() {
	dobin "${WORKDIR}/${PN}-${PV}_build/tifig"
}
