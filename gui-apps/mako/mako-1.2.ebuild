# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="A lightweight Wayland notification daemon"
HOMEPAGE="https://wayland.emersion.fr/mako"
SRC_URI="https://github.com/emersion/${PN}/archive/v${PV}.tar.gz -> mako-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
IUSE=""

RDEPEND="sys-libs/libcap
	|| ( sys-apps/systemd
		sys-auth/elogind )
	dev-libs/wayland
	x11-libs/pango
	x11-libs/cairo
"
DEPEND="${RDEPEND}
	>=dev-libs/wayland-protocols-1.14
"
