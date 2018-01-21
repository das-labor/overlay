# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 autotools

DESCRIPTION="The libtpms library provides software emulation of a Trusted Platform Module (TPM 1.2 and TPM 2)"
HOMEPAGE="https://github.com/stefanberger/libtpms"
SRC_URI=""
EGIT_REPO_URI="https://github.com/stefanberger/libtpms.git"
EGIT_TAG="master"
LICENSE="BSD-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+openssl"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
   eapply_user
   eautoreconf
}

src_configure() {
	econf \
		$(use_with openssl )
}
