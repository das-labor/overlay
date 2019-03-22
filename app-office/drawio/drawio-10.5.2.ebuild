# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Flowchart maker and diagram software"
HOMEPAGE="https://about.draw.io/"
SRC_URI="
	https://github.com/jgraph/drawio/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://registry.npmjs.org/commander/-/commander-2.15.1.tgz
	https://registry.npmjs.org/electron-log/-/electron-log-2.2.14.tgz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="
	${DEPEND}
	|| ( dev-util/electron dev-util/electron-bin )
"
BDEPEND=""

src_unpack() {
	unpack ${P}.tar.gz
	unpack commander-2.15.1.tgz
	mv package commander
	unpack electron-log-2.2.14.tgz
	mv package electron-log
}

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
	mkdir node_modules
	mv ${WORKDIR}/commander node_modules/
	mv ${WORKDIR}/electron-log node_modules/
	_cleanup
	eapply_user
}

src_install() {
	insinto /usr/share/drawio
	doins -r src/main/webapp
	insinto /usr/share/applications
	doins "${FILESDIR}"/drawio.desktop
	dobin "${FILESDIR}"/drawio
}
