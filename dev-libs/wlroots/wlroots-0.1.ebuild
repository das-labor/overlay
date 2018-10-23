# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Pluggable, composable modules for building a Wayland compositor."
HOMEPAGE="https://github.com/SirCmpwn/wlroots"

SRC_URI="https://github.com/swaywm/wlroots/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE="libcap systemd"

DEPEND="
x11-libs/libxkbcommon
dev-libs/libinput
x11-libs/libdrm
>=dev-libs/wayland-1.16.0
dev-libs/wayland-protocols
virtual/libudev
x11-libs/pixman
media-libs/mesa[egl,gles2,gbm]
x11-libs/libxcb
x11-proto/xcb-proto
libcap? ( sys-libs/libcap )
systemd? ( sys-apps/systemd )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local emesonargs=(
		-Denable_libcap=$(usex libcap true false)
		-Denable_systemd=$(usex systemd true false)
	)
	meson_src_configure
}
