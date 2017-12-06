# Copyright (c) 2017 Gentoo. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit git-r3

DESCRIPTION="Open source tool to operate a Dediprog EM100Pro Serial Flash Emulator on Linux and OSX."
HOMEPAGE="https://review.coreboot.org/em100.git"
EGIT_REPO_URI="https://review.coreboot.org/em100.git"
EGIT_BRANCH="master"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="virtual/libusb:1"
DEPEND="${RDEPEND}"

src_install() {
	dobin em100
	einstalldocs
}
