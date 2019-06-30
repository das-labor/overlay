# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Select a region in a Wayland compositor"
HOMEPAGE="https://wayland.emersion.fr/slurp"
SRC_URI="https://github.com/emersion/${PN}/archive/v${PV}.tar.gz -> slurp-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="x11-libs/cairo
		dev-libs/wayland
		app-text/scdoc"
RDEPEND="${DEPEND}"
BDEPEND=""

