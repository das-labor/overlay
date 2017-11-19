# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="A libre cross platform disassembler"
HOMEPAGE="https://www.panopticon.re"
SRC_URI="https://github.com/das-labor/panopticon/archive/${PV}.tar.gz"
KEYWORDS="amd64 x86"
LICENSE="GPL-3"
SLOT="0"
IUSE="debug test"

RDEPEND="
	( >=dev-qt/qtgui-5.4.0
	  >=dev-qt/qtwidgets-5.4.0
	  >=dev-qt/qtdeclarative-5.4.0
	  >=dev-qt/qtquickcontrols-5.4.0[widgets] )
	"
DEPEND="${RDEPEND}
	dev-lang/rust
	dev-util/cargo
	dev-util/cmake"

RESTRICT="strip"

src_compile() {
	if use debug
	then
		cargo build --verbose --all
	else
		cargo build --release --verbose --all
	fi
}

src_install() {
	local build_dir=target/release
	if use debug
	then
		build_dir=target/debug
	fi
	dobin "${build_dir}/qtpanopticon"
	insinto /usr/share/panopticon/
	doins -r qml
	insinto /usr/share/applications/
	doins "${FILESDIR}/qtpanopticon.desktop"
	insinto /usr/share/pixmaps/
	doins "${FILESDIR}/panopticon.svg"
}

src_test() {
	if use test
	then
		cargo test --verbose --all
	fi
}
