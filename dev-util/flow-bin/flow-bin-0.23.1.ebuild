# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="A static type checker for javascript"
HOMEPAGE="http://flowtype.org"
SRC_URI="https://github.com/facebook/flow/releases/download/v${PV}/flow-linux64-v${PV}.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
	mv */ ${P}
}

src_install() {
	into /opt
	dobin flow
}
