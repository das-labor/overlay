# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Load and run EFI PE image files on your favorite operation system (Linux)"
HOMEPAGE="https://github.com/jethrogb/uefireverse"
commit=594feb8d2bdede7a587e7c0844ae264d50eb03f0
SRC_URI="
	https://github.com/jethrogb/uefireverse/archive/$commit.tar.gz -> uefireverse-$commit.tar.gz
	https://github.com/jemalloc/jemalloc/archive/3.6.0.tar.gz -> jemalloc-3.6.0.tar.gz
"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sys-boot/gnu-efi"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/uefireverse-${commit}/efiperun"

src_prepare() {
	mv ../../jemalloc-3.6.0 .
	cd jemalloc-3.6.0
	./autogen.sh
	./configure --with-jemalloc-prefix=__jemalloc_
	make
	default
}

src_install() {
	dobin efiperun
}
