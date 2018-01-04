# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit qmake-utils eutils

DESCRIPTION="Library and tool for personalization of Yubico's YubiKey NEO"
SRC_URI="https://github.com/Yubico/yubioath-desktop/archive/${P}.tar.gz"
HOMEPAGE="http://opensource.yubico.com/yubioath-desktop"

KEYWORDS="amd64 x86"
SLOT="4"
LICENSE="BSD-2"
USE="broken"

RDEPEND="dev-qt/qtsingleapplication
		 >=app-crypt/yubikey-manager-0.5.0
		 sys-apps/pcsc-lite
		 app-crypt/ccid
		 dev-python/pyside
		 dev-python/pyscard
		 dev-python/pbkdf2
		 dev-python/pyside-tools
		 dev-python/setuptools
		 dev-python/pycrypto
		 sys-auth/yubikey-personalization-gui
		 dev-python/click
		 dev-python/pyotherside
		 dev-qt/qtsingleapplication[qt5]"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}-${P}"

src_prepare() {
	epatch ${FILESDIR}/qtsingleapp.patch
	eapply_user
}

src_configure() {
	eqmake5 yubioath-desktop.pro
	python build_qrc.py resources.json
}

src_install() {
	emake install INSTALL_ROOT="${D}"
#    python_optimize  # does all packages by default
	domenu resources/yubioath.desktop
	doicon resources/icons/yubioath.png

	emake compiler_rcc_make_all
	emake compiler_buildqrc_make_all
	emake compiler_moc_header_make_all

}
