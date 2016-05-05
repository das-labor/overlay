# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils eutils git-r3

DESCRIPTION="i3-compatible window manager for Wayland"
HOMEPAGE="https://github.com/SirCmpwn/sway"
EGIT_REPO_URI="https://github.com/SirCmpwn/sway.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE='+systemd'

DEPEND="
	${RDEPEND}
	app-text/asciidoc
	"

RDEPEND="
	dev-libs/json-c
	dev-libs/libpcre
	dev-libs/wlc
	media-gfx/imagemagick[png,raw]
	x11-base/xorg-server[wayland]
	x11-libs/cairo
	x11-libs/gdk-pixbuf[jpeg]
	x11-libs/libxkbcommon
	x11-libs/pango
	systemd? ( sys-apps/systemd )
	"

src_install() {
	cmake-utils_src_install
	use !systemd && fperms u+s '/usr/bin/sway'
}
