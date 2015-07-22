# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Programming language and IDE for electronic arts, new media art, and visual design communities"
HOMEPAGE="https://processing.org"
SRC_URI="
	amd64? ( http://download.processing.org/processing-2.2.1-linux64.tgz )
	x86?   ( http://download.processing.org/processing-2.2.1-linux32.tgz )
"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"

DEPEND=""
RDEPEND="${DEPEND}"

DOCS="README"

src_unpack() {
	unpack ${A}
	mv */ ${P}
}

src_install() {
	dodir "/opt/${PN}"
	cp -R * "${D}/opt/${PN}"
	dosym "/opt/${PN}/processing" "/opt/bin/processing"
}
