# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit fcaps meson

DESCRIPTION="Highly customizable Wayland bar for Sway and Wlroots based compositors."
HOMEPAGE="https://github.com/Alexays/Waybar"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Alexays/Waybar.git"
else
	SRC_URI="https://github.com/Alexays/Waybar/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE="+pulseaudio +tray"
S="$WORKDIR/Waybar-$PV"

DEPEND="dev-libs/libinput
	>=dev-libs/libfmt-5.2.1
	dev-libs/wayland
	gui-libs/wlroots
	tray? ( dev-cpp/gtkmm:3.0 )
	tray? ( dev-libs/libdbusmenu )
	dev-libs/jsoncpp
	dev-libs/libsigc++:2
	dev-libs/libnl
	pulseaudio? ( media-sound/pulseaudio )
	virtual/libudev
"
RDEPEND="${DEPEND}"

src_configure() {
	local emesonargs=(
		-Dpulseaudio=$(usex pulseaudio enabled disabled)
		-Ddbusmenu-gtk=$(usex tray enabled disabled)
	)

	meson_src_configure
}
