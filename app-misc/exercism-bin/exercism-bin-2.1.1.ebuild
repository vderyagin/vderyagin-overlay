# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="A Go based command line tool for http://exercism.io"
HOMEPAGE="https://github.com/exercism/cli"
SRC_URI="
	amd64? ( https://github.com/exercism/cli/releases/download/v${PV}/exercism-linux-64bit.tgz )
	x86?   ( https://github.com/exercism/cli/releases/download/v${PV}/exercism-linux-32bit.tgz )
"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

src_unpack() {
	mkdir "${S}"
	cd "${S}"
	unpack "${A}"
}

src_install() {
	dobin "exercism"
}
