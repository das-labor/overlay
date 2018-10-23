# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION=""
HOMEPAGE=""
# 1.0_beta_p1 -> 1.0-beta.1
MY_PV=$(ver_rs 2 '-' 3 '.')
MY_PV=${MY_PV//p/}
SRC_URI="https://github.com/swaywm/sway/archive/${MY_PV}.tar.gz -> ${PN}-${MY_PV}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/wlroots"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${PN}-${MY_PV}"
