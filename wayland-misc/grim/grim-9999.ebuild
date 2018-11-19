# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson git-r3

DESCRIPTION="Grab images from a Wayland compositor"
HOMEPAGE="https://wayland.emersion.fr/grim"
SRC_URI=""
EGIT_REPO_URI="https://github.com/emersion/grim.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="x11-libs/cairo
		dev-libs/wayland"
RDEPEND="${DEPEND}"
BDEPEND=""

