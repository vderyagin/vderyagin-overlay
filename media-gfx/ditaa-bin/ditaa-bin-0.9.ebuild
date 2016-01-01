# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="CLI utility that converts ascii-art diagrams to nice-looking bitmap diagrams"
HOMEPAGE="http://ditaa.sourceforge.net"
SRC_URI="http://downloads.sourceforge.net/project/ditaa/ditaa/${PV}/ditaa0_9.zip?use_mirror=autoselect -> ${P}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"

DEPEND=""
RDEPEND="${DEPEND}"

DOCS="HISTORY"

src_unpack() {
	mkdir ${P}
	cd ${P}
	unpack ${A}
}

src_install() {
	dodir "/opt/${PN}"
	cp -R *.jar "${D}/opt/${PN}/ditaa.jar"

	into /opt
	dobin "${FILESDIR}/ditaa"

	default
}
