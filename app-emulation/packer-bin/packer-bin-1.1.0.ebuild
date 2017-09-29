# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MY_PN=${PN%-bin}
DESCRIPTION="Tool for creating virtual machine images"
HOMEPAGE="https://www.packer.io/"
SRC_URI="
	amd64? ( https://releases.hashicorp.com/${MY_PN}/${PV}/${MY_PN}_${PV}_linux_amd64.zip )
	x86? ( https://releases.hashicorp.com/${MY_PN}/${PV}/${MY_PN}_${PV}_linux_386.zip )
	"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}"/

src_install() {
	dobin ${MY_PN}
}
