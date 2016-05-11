# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils gnome2-utils pax-utils

DESCRIPTION="P2P Internet Telephony (VoiceIP) client"
HOMEPAGE="http://www.skype.com/"
SRC_URI="http://download.${PN}.com/linux/${P}.tar.bz2"

LICENSE="skype-4.0.0.7-copyright BSD MIT RSA W3C regexp-UofT no-source-code"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="pax_kernel +pulseaudio"

QA_PREBUILT=opt/bin/${PN}
RESTRICT="mirror bindist strip"

RDEPEND="
	virtual/ttf-fonts
	dev-qt/qtcore:4[abi_x86_32(-)]
	dev-qt/qtdbus:4[abi_x86_32(-)]
	dev-qt/qtgui:4[accessibility,abi_x86_32(-)]
	media-libs/alsa-lib[abi_x86_32(-)]
	x11-libs/libX11[abi_x86_32(-)]
	x11-libs/libXext[abi_x86_32(-)]
	x11-libs/libXScrnSaver[abi_x86_32(-)]
	x11-libs/libXv[abi_x86_32(-)]
	pulseaudio? ( media-sound/pulseaudio[abi_x86_32(-)] )"

src_install() {

	into /opt
	dobin ${PN}
	fowners root:audio /opt/bin/${PN}

	insinto /etc/dbus-1/system.d
	doins ${PN}.conf

	insinto /usr/share/skype
	doins -r avatars lang sounds

	dodoc README

	local res
	for res in 16 32 48 64 96 128 256; do
		newicon -s ${res} icons/SkypeBlue_${res}x${res}.png ${PN}.png
	done

	if use pax_kernel; then
		pax-mark Cm "${ED}"/opt/bin/${PN}
	fi

	echo PRELINK_PATH_MASK=/opt/bin/${PN} > ${T}/99${PN}
	doenvd "${T}"/99${PN} #430142
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
