# Copyright 1999-2016 Gentoo Foundation
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
SLOT="3"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"

DEPEND="app-eselect/eselect-processing"
RDEPEND="${DEPEND}"

DOCS="revisions.txt"

src_unpack() {
	unpack ${A}
	mv "processing-${PV}" "${S}"
}

src_prepare() {
	rm --recursive \
		"${S}"/modes/java/libraries/serial/library/{linux-armv6hf,macosx,windows*} \
		"${S}"/modes/java/application/launch4j/w32api
}

src_install() {
	dodir "/opt/${PN}-${SLOT}"
	cp --archive \
		"${S}/"{core,java,lib,modes,tools,processing,processing-java} \
		"${D}/opt/${PN}-${SLOT}"

	default
}

pkg_postinst() {
	eselect processing update --if-unset
}
