# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 autotools eutils

DESCRIPTION="The libtpms library provides software emulation of a Trusted Platform Module (TPM 1.2 and TPM 2)"
HOMEPAGE="https://github.com/stefanberger/libtpms"
SRC_URI=""
EGIT_REPO_URI="https://github.com/stefanberger/libtpms.git"
EGIT_BRANCH="tpm2-preview.rev146.v2"
LICENSE="BSD-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+ssl libressl"

DEPEND="
	ssl? (
	    !libressl? ( dev-libs/openssl )
		libressl? ( dev-libs/libressl )
	)"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	eautoreconf

	if use libressl ; then
		epatch "${FILESDIR}/libressl.patch"
	fi
}

src_configure() {
	econf --with-openssl
}
