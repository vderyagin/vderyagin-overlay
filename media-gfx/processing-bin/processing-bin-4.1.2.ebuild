# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Programming language & IDE for electronic arts, new media art, and visual design"
HOMEPAGE="https://processing.org"

SRC_URI="https://github.com/processing/processing4/releases/download/processing-1290-4.1.2/processing-4.1.2-linux-x64.tgz"

LICENSE="GPL-2"
SLOT="4"
KEYWORDS="~amd64"
RESTRICT="mirror"

DEPEND="app-eselect/eselect-processing"
RDEPEND="${DEPEND}"

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
	dodir "/opt/${PN}-${SLOT}"
	cp --archive \
		"${S}/"{core,java,lib,modes,tools,processing,processing-java} \
		"${D}/opt/${PN}-${SLOT}"
}

pkg_postinst() {
	eselect processing update --if-unset
}
