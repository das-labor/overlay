# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit pax-utils user

DESCRIPTION="Multichat messenger"
HOMEPAGE="http://meetfranz.com/"
SRC_URI="http://downloads.meetfranz.com/releases/${PV}/Franz-linux-x64-${PV}.tgz"

LICENSE="Propietary"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+sandbox pax_kernel"
RDEPEND="sandbox? ( sys-apps/firejail )"
DEPEND="${RDEPEND}"

RESTRICT="strip binchecks"

S="${WORKDIR}"

src_install() {
	if use sandbox ; then
		insinto /etc/firejail
		doins "${FILESDIR}/franz.profile"
	fi

	if use pax_kernel ; then
		pax-mark -pmr "${S}/Franz" || die
	fi
	
	dodir /opt/franz
	insinto /opt/franz
	doins -r resources
	doins -r locales
	doins content_shell.pak
	doins icudtl.dat
	doins libffmpeg.so
	doins libgcrypt.so.11
	doins libnode.so
	doins natives_blob.bin
	doins snapshot_blob.bin
	doins Franz
	fperms 775 /opt/franz/Franz
	
	if use pax_kernel ; then
		insinto /opt/bin
		doins "${FILESDIR}/franz"
		fperms 775 /opt/bin/franz
	else
		dosym /opt/franz/Franz /opt/bin/franz
	fi
}
