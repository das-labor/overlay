# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils

DESCRIPTION="A fast and easy-to-use tool for creating status bars."
HOMEPAGE="https://github.com/jaagr/polybar"
I3IPCPP_VER="0.7.0"
XPP_VER="00165e1a6d5dd61bc153e1352b21ec07fc81245d" # see https://github.com/jaagr/polybar/issues/1090
SRC_URI="
	https://github.com/jaagr/polybar/archive/${PV}.tar.gz -> polybar-${PV}.tar.gz
	https://github.com/jaagr/i3ipcpp/archive/v${I3IPCPP_VER}.tar.gz -> i3ipcpp-${I3IPCPP_VER}.tar.gz
	https://github.com/jaagr/xpp/archive/${XPP_VER}.tar.gz -> xpp-${XPP_VER}.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="x86 amd64"

IUSE="alsa i3wm mpd github +network"
RDEPEND="
	x11-libs/libxcb
	dev-lang/python:2.7
	x11-base/xcb-proto
	x11-libs/xcb-util-wm
	x11-libs/xcb-util-image

	alsa? ( media-libs/alsa-lib )
	i3wm? ( dev-libs/jsoncpp )
	mpd? ( media-libs/libmpdclient )
	github? ( net-misc/curl )
	network? ( net-wireless/wireless-tools )
"
DEPEND="${RDEPEND}"

CMAKE_BUILD_TYPE=Release
#S="${WORKDIR}/

src_prepare() {
	rm -R lib/i3ipcpp && mv ../i3ipcpp-$I3IPCPP_VER lib/i3ipcpp || die "Error"
	rm -R lib/xpp && mv ../xpp-$XPP_VER lib/xpp || die "Error"
	default
}

src_configure() {
	local mycmakeargs=(
		-DPYTHON_EXECUTABLE:FILEPATH=/usr/bin/python2
		-DENABLE_ALSA="$(usex alsa)"
		-DENABLE_MPD="$(usex mpd)"
		-DENABLE_NETWORK="$(usex network)"
		-DENABLE_I3="$(usex i3wm)"
		-DENABLE_CURL="$(usex github)"
	)
	cmake-utils_src_configure
}
