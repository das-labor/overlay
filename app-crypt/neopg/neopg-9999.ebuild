# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit git-r3

DESCRIPTION="The multiversal cryptoengine!"
HOMEPAGE="https://github.com/lambdafu/neopg"
SRC_URI=""
EGIT_REPO_URI="https://github.com/lambdafu/neopg"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~ppc-aix ~x64-cygwin ~amd64-fbsd ~x86-fbsd ~amd64-linux ~arm-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE="bzip2 +gnutls nls readline selinux +smartcard usb"

COMMON_DEPEND_LIBS="
	>=dev-libs/botan-2.0.0
	dev-util/gcovr
	dev-util/lcov
	gnutls? ( >=net-libs/gnutls-3.0:0= )
	sys-libs/zlib
	bzip2? ( app-arch/bzip2 )
	readline? ( sys-libs/readline:0= )
	smartcard? ( usb? ( virtual/libusb:0 ) )
	>=dev-db/sqlite-3.7
	"
COMMON_DEPEND_BINS="app-crypt/pinentry
	!app-crypt/dirmngr"

# Existence of executables is checked during configuration.
DEPEND="${COMMON_DEPEND_LIBS}
	${COMMON_DEPEND_BINS}
	nls? ( sys-devel/gettext )"

RDEPEND="${COMMON_DEPEND_LIBS}
	${COMMON_DEPEND_BINS}
	selinux? ( sec-policy/selinux-gpg )
	nls? ( virtual/libintl )"

src_prepare() {
	mkdir -p build && cd build && cmake -DCMAKE_BUILD_TYPE=Release ..
	eapply_user
}

src_compile() {
	cd build && emake
}

src_install() {
	dobin build/src/neopg
}
