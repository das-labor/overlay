# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="A fast HEIF image converter aimed at thumbnailing"
SRC_URI="https://github.com/monostream/tifig/archive/${PV}.tar.gz -> ${P}.tar.gz"
HOMEPAGE="https://github.com/monostream/tifig"

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
