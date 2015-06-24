# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="The Haskell Tool Stack"
HOMEPAGE="https://www.stackage.org"
SRC_URI="https://github.com/commercialhaskell/stack/releases/download/v${PV}/stack-${PV}-x86_64-linux.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

src_unpack() {
	mkdir "${S}"
	cd "${S}"
	unpack ${A}
	mv stack-* stack
}

src_install() {
	into /opt
	dobin stack
}
