# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3

DESCRIPTION="Purple LINE plugin for pidgin"
HOMEPAGE="http://altrepo.eu/git/purple-line.git"
EGIT_REPO_URI="https://github.com/zaolin/pidgin-line.git"

if [[ ${PV} == "9999" ]] ; then
	EGIT_BRANCH="master"
	KEYWORDS=""
fi


LICENSE=""
SLOT="0"

DEPEND="
		dev-util/apache-thrift"

RDEPEND="${DEPEND}"

src_compile() {
	emake
}

src_install() {
	emake DESTDIR="${D}" install
}
