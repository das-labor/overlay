# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="https://zoom.us/"
HOMEPAGE="Zoom client for Linux"
#SRC_URI="https://zoom.us/client/${PV}/zoom_x86_64.tar.xz -> zoom-${PV}_x86_64.tar.xz"
SRC_URI="https://zoom.us/client/${PV}/zoom_x86_64.pkg.tar.xz -> zoom-${PV}_x86_64.pkg.tar.xz"
#SRC_URI="https://d11yldzmag5yn.cloudfront.net/prod/${PV}/zoom_x86_64.pkg.tar.xz zoom-${PV}_x86_64.pkg.tar.xz"

LICENSE="UNLICENSED"
SLOT="0"
KEYWORDS=""
IUSE=""

_QT_DEPEND="
	>=dev-qt/qtcore-5.9.5
	>=dev-qt/qtdbus-5.9.5
	>=dev-qt/qtdeclarative-5.9.5
	>=dev-qt/qtgui-5.9.5
	>=dev-qt/qtnetwork-5.9.5
	>=dev-qt/qtpositioning-5.9.5
	>=dev-qt/qtprintsupport-5.9.5
	>=dev-qt/qtscript-5.9.5
	>=dev-qt/qtwebchannel-5.9.5
	>=dev-qt/qtwebengine-5.9.5
	>=dev-qt/qtwidgets-5.9.5
"

DEPEND=""
RDEPEND="
	${DEPEND}
	${_QT_DEPEND}
	>=dev-libs/icu-56
	>=media-libs/libjpeg-turbo-1.5.0

	>=app-arch/bzip2-1.0.6-r9
	>=app-arch/lz4-1.8.0
	>=app-arch/snappy-1.1.7
	>=dev-libs/double-conversion-3.0.0
	>=dev-libs/expat-2.2.5
	>=dev-libs/glib-2.52.3
	>=dev-libs/libbsd-0.8.6
	>=dev-libs/libevent-2.1.8
	>=dev-libs/libgcrypt-1.8.3
	>=dev-libs/libgpg-error-1.29
	>=dev-libs/libpcre2-10.30
	>=dev-libs/libpcre-8.41-r1
	>=dev-libs/libxml2-2.9.8
	>=dev-libs/libxslt-1.1.32
	>=dev-libs/nspr-4.19
	>=dev-libs/nss-3.37.3
	>=dev-libs/openssl-1.0.2o-r6
	>=dev-libs/openssl-1.1.0h-r2
	>=dev-libs/re2-0.2018.04.01
	>=media-gfx/graphite2-1.3.10
	>=media-libs/alsa-lib-1.1.2
	>=media-libs/fontconfig-2.12.6
	>=media-libs/freetype-2.9.1-r3
	>=media-libs/harfbuzz-1.7.6
	>=media-libs/libogg-1.3.3
	>=media-libs/libpng-1.6.34
	>=media-libs/libtheora-1.1.1-r1
	>=media-libs/libvorbis-1.3.6
	>=media-libs/libvpx-1.7.0
	>=media-libs/libwebp-0.5.2
	>=media-libs/mesa-18.1.2
	>=media-libs/opus-1.2.1
	>=media-libs/x264-0.0.20170701
	>=media-sound/lame-3.100-r1
	>=media-video/ffmpeg-3.4.2-r1
	>=sys-apps/attr-2.4.47-r2
	sys-apps/dbus
	sys-apps/systemd
	sys-apps/util-linux
	sys-devel/gcc
	sys-libs/glibc
	>=sys-libs/libcap-2.24-r2
	>=sys-libs/zlib-1.2.11-r1
	>=x11-libs/libdrm-2.4.92
	>=x11-libs/libX11-1.6.5-r1
	>=x11-libs/libXau-1.0.8-r1
	>=x11-libs/libxcb-1.13
	>=x11-libs/libXcomposite-0.4.4-r2
	>=x11-libs/libXcursor-1.1.15
	>=x11-libs/libXdamage-1.1.4-r2
	>=x11-libs/libXdmcp-1.1.2-r2
	>=x11-libs/libXext-1.3.3-r1
	>=x11-libs/libXfixes-5.0.3-r1
	>=x11-libs/libXi-1.7.9-r1
	>=x11-libs/libXrender-0.9.10-r1
	>=x11-libs/libXScrnSaver-1.2.2-r2
	>=x11-libs/libxshmfence-1.3-r1
	>=x11-libs/libXtst-1.2.3-r1
	>=x11-libs/libXxf86vm-1.1.4-r1
	>=x11-libs/xcb-util-0.4.0-r1
	>=x11-libs/xcb-util-image-0.4.0-r1
	>=x11-libs/xcb-util-keysyms-0.4.0-r1
"

S="${WORKDIR}"


src_compile() {
	echo "Nothing to compile :)"
}

src_install() {
	exeinto /usr/bin
	doexe zoom/zoom
}
