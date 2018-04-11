# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit qt4-r2

DESCRIPTION='Ponies on your desktop.'
HOMEPAGE='https://github.com/myszha/qt-ponies'

SRC_URI="https://github.com/myszha/qt-ponies/archive/v${PV}.tar.gz"

LICENSE='GPL-3'
SLOT='0'

DEPEND='dev-qt/qtcore:4
		dev-qt/qtgui:4'
RDEPEND="${DEPEND}"
