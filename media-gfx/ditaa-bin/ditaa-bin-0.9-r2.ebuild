# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

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
	mkdir "${S}"
	cd "${S}"
	unpack ${A}
}

src_install() {
	einstalldocs

	dodir "/opt/${PN}"
	cp --archive "${S}"/ditaa*.jar "${D}/opt/${PN}/ditaa.jar"

	into /opt
	dobin "${FILESDIR}/ditaa"
}
