# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit check-reqs font

DESCRIPTION="Collection of fonts that are patched to include a high number of glyphs (icons)."
HOMEPAGE="http://nerdfonts.com/"
SRC_URI="https://github.com/ryanoasis/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
DEPEND=""
RDEPEND="media-libs/fontconfig"

FONT_CONF=( "${S}"/10-nerd-font-symbols.conf )
FONT_S=${S}
FONT_SUFFIX="otf ttf"
DOCS="readme.md"

CHECKREQS_DISK_BUILD="3G"
CHECKREQS_DISK_USR="4G"

pkg_pretend() {
	check-reqs_pkg_setup
}

src_prepare() {
	default
	# move all patched font files to a single directory so font_src_install works
	find patched-fonts/ \( -name '*.otf' -o -name '*.ttf' \) -exec mv {} . \; || die "Finding fonts failed."
	# the windows compatible fonts are not necessary on linux ;)
	find -iname '*windows*' -print0 | xargs -0 rm
}

src_install() {
	einfo "Installing fonts into /usr/share/fonts - this might take a while."
	font_src_install
}

pkg_postinst() {
	einfo "Installing font-patcher via an ebuild is hard, because paths are hardcoded differently"
	einfo "in .sh files. You can still get it and use it by git cloning the nerd-font project and"
	einfo "running it from the cloned directory."
	einfo "https://github.com/ryanoasis/nerd-fonts"

	elog "You might have to enable 50-user.conf and 10-nerd-font-symbols.conf by using "
	elog "eselect fontconfig"
}
