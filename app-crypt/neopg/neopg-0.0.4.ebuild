# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

DESCRIPTION="The multiversal cryptoengine!"
HOMEPAGE="https://github.com/das-labor/neopg"

GOOGLETEST_VER=1.8.0
PEGTL_VER=2.3.0
RANG_VER=2.1

SRC_URI="https://github.com/das-labor/neopg/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/google/googletest/archive/release-${GOOGLETEST_VER}.tar.gz -> googletest-${GOOGLETEST_VER}.tar.gz
	https://github.com/taocpp/PEGTL/archive/${PEGTL_VER}.tar.gz -> pegtl-${PEGTL_VER}.tar.gz
	https://github.com/agauniyal/rang/archive/${RANG_VER}.tar.gz -> rang-${RANG_VER}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~ppc-aix ~x64-cygwin ~amd64-fbsd ~x86-fbsd ~amd64-linux ~arm-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE="bzip2 +gnutls nls readline selinux +smartcard usb"

COMMON_DEPEND_LIBS="
	>=dev-libs/botan-2.0.0
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
	rmdir 3rdparty/googletest && mv "../googletest-release-${GOOGLETEST_VER}" 3rdparty/googletest
	rmdir 3rdparty/pegtl && mv "../PEGTL-${PEGTL_VER}" 3rdparty/pegtl
	rmdir 3rdparty/rang && mv "../rang-${RANG_VER}" 3rdparty/rang
	eapply_user
}

src_configure() {
	cd build && cmake -DCMAKE_BUILD_TYPE=Release ..
}

src_compile() {
	cd build && emake
}

src_install() {
	dobin build/src/neopg
}
