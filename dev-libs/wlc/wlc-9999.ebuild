# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils eutils git-r3

DESCRIPTION="Wayland compositor library"
HOMEPAGE="https://github.com/Cloudef/wlc"
EGIT_REPO_URI="https://github.com/Cloudef/wlc.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="systemd test"

DEPEND="${RDEPEND}
		media-libs/mesa[egl,gles2,wayland]
		x11-libs/libX11
		x11-libs/libxcb
		x11-libs/xcb-util-image"

RDEPEND="
		dev-libs/libinput
		>=dev-libs/wayland-1.7
		virtual/udev
		x11-libs/libxkbcommon
		x11-libs/pixman
		systemd? ( sys-apps/systemd )"


src_prepare() {
	cmake-utils_src_prepare
}

src_configure() {
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_test() {
	use test && cmake-utils_src_test
}

src_install() {
	cmake-utils_src_install
}
