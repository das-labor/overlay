# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Meta package for installing servo utils"
HOMEPAGE="https://www.chromium.org/chromium-os/servo"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-google/flashrom
	dev-google/ec-devutils
	dev-google/openocd
	dev-google/hdctools"
RDEPEND="${DEPEND}"
