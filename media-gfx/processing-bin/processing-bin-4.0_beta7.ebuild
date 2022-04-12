# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Programming language & IDE for electronic arts, new media art, and visual design"
HOMEPAGE="https://processing.org"

SRC_URI="https://github.com/processing/processing4/releases/download/processing-1282-4.0b7/processing-4.0b7-linux-x64.tgz"

LICENSE="GPL-2"
SLOT="4"
KEYWORDS="~amd64"
RESTRICT="mirror"

DEPEND="app-eselect/eselect-processing"
RDEPEND="${DEPEND}"

DOCS="changes.md"

src_unpack() {
	unpack ${A}
	mv processing-* "${S}"
}

src_prepare() {
	default

	rm --recursive \
		 "${S}"/modes/java/libraries/io/library/linux-arm* \
		 "${S}"/modes/java/libraries/javafx \
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
