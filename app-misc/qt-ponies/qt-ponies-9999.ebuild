# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit qmake-utils git-r3

DESCRIPTION='Ponies on your desktop.'
HOMEPAGE='https://github.com/myszha/qt-ponies'

EGIT_REPO_URI='https://github.com/myszha/qt-ponies.git'

LICENSE='GPL-3'
SLOT='0'

DEPEND='dev-qt/qtcore:5
		dev-qt/qtgui:5
		dev-qt/qtwidgets:5'
RDEPEND="${DEPEND}"

PATCHES="${FILESDIR}/qt-ponies-qt5.patch"

src_prepare() {
	sed -i "s/.\/desktop-ponies/\/usr\/share\/qt-ponies\/desktop-ponies/g" src/configwindow.cpp
	default
	eqmake5
}

src_install() {
	emake install INSTALL_ROOT="${D}"
}
