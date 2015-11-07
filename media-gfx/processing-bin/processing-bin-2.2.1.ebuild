# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Programming language & IDE for electronic arts, new media art, and visual design"
HOMEPAGE="https://processing.org"
SRC_URI="
	amd64? ( http://download.processing.org/processing-${PV}-linux64.tgz )
	x86?   ( http://download.processing.org/processing-${PV}-linux32.tgz )
"

LICENSE="GPL-2"
SLOT="2"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"

DEPEND="app-eselect/eselect-processing"
RDEPEND="${DEPEND}"

DOCS="revisions.txt"

src_unpack() {
	unpack ${A}
	mv */ ${P}
}

src_install() {
	dodir "/opt/${PN}-${SLOT}"
	cp -R * "${D}/opt/${PN}-${SLOT}"

	default
}

pkg_postinst() {
	eselect processing update --if-unset
}
