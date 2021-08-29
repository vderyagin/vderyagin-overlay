# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Programming language & IDE for electronic arts, new media art, and visual design"
HOMEPAGE="https://processing.org"

SRC_URI="http://download.processing.org/processing-${PV}-linux64.tgz"

LICENSE="GPL-2"
SLOT="3"
KEYWORDS="~amd64"
RESTRICT="mirror"

DEPEND="app-eselect/eselect-processing"
RDEPEND="${DEPEND}"

DOCS="revisions.txt"

src_unpack() {
	unpack ${A}
	mv "processing-${PV}" "${S}"
}

src_prepare() {
	default

	rm --recursive \
		"${S}"/modes/java/libraries/serial/library/{linux-armv6hf,macosx,windows*} \
		"${S}"/modes/java/application/launch4j/w32api
}

src_install() {
	einstalldocs

	dodir "/opt/${PN}-${SLOT}"
	cp --archive \
		"${S}/"{core,java,lib,modes,tools,processing,processing-java} \
		"${D}/opt/${PN}-${SLOT}"
}

pkg_postinst() {
	eselect processing update --if-unset
}
