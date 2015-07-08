# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="Smalltalk IDE focused on simplicity and immediate feedback"
HOMEPAGE="http://pharo.org"
SRC_URI="http://files.pharo.org/platform/Pharo4.0-linux.zip"

RESTRICT="mirror"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

RDEPEND="gnome-extra/zenity"
DEPEND=""

DOCS="README.txt"

src_unpack() {
	unpack ${A}
	mv */ ${P}
}

src_prepare() {
	epatch "${FILESDIR}/${P}-images-location.patch"
}

src_install() {
	dodir "/opt/${PN}"
	cp -R * "${D}/opt/${PN}"
	dosym "/opt/${PN}/pharo" "/opt/bin/pharo"

	dodoc ${DOCS}
}
