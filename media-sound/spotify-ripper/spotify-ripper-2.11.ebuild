# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 pypy )

inherit distutils-r1

DESCRIPTION="Command-line ripper for Spotify, with a workaround for playlist emptying"
HOMEPAGE="https://github.com/SolidHal/spotify-ripper"
SRC_URI="https://github.com/SolidHal/spotify-ripper/archive/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/pyspotify
		dev-python/spotipy
		dev-python/colorama
		media-libs/mutagen
		dev-python/requests
		dev-python/schedule"
RDEPEND="${DEPEND}
		media-sound/lame"
