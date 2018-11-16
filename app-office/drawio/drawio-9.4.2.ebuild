# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Flowchart maker and diagram software"
HOMEPAGE="https://about.draw.io/"
SRC_URI="https://github.com/jgraph/drawio/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="
	${DEPEND}
	dev-util/electron
"
BDEPEND="net-libs/nodejs[npm]"

_cleanup() {
	# Remove various development and/or inappropriate files and
	# useless docs of dependend packages
	local find_exp="-or -name"
	local find_name=()
	for match in "AUTHORS*" "CHANGELOG*" "CONTRIBUT*" "README*" \
		".travis.yml" ".eslint*" ".wercker.yml" ".npmignore" \
		"*.md" "*.markdown" "*.bat" "*.cmd" "doc/"
	do
		find_name+=( ${find_exp} "${match}" )
	done

	find node_modules \
		\( -type d -name examples \) -or \( -type f \( \
			-iname "LICEN?E*" \
			"${find_name[@]}" \
		\) \) -exec rm -rf "{}" \;
}

src_prepare() {
	cd src/main/webapp
	# prefix due to sandbox violations
	npm install --production --prefix=${PWD} || die "npm error"
	_cleanup
	eapply_user
}

src_install() {
	insinto /usr/share/drawio
	doins -r src/main/webapp
	insinto /usr/share/applications
	doins "${FILESDIR}"/drawio.desktop
}
