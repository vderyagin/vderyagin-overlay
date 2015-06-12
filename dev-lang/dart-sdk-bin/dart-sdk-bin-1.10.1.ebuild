# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="The Dart SDK, including the VM, dart2js, core libraries, and more"
HOMEPAGE="https://dartlang.org"
SRC_URI="
	amd64? ( https://storage.googleapis.com/dart-archive/channels/stable/release/45692/sdk/dartsdk-linux-x64-release.zip )
	x86?   ( https://storage.googleapis.com/dart-archive/channels/stable/release/45692/sdk/dartsdk-linux-ia32-release.zip )
"
RESTRICT="mirror"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

RDEPEND=""
DEPEND=""

DOCS="README revision version"

src_unpack() {
	unpack ${A}
	mv dart-sdk ${P}
}

src_install() {
	dodir "/opt/${PN}"
	cp -R "bin" "include" "lib" "${D}/opt/${PN}"
	newenvd "${FILESDIR}/${PN}-PATH.env" "81${PN}"
	dodoc ${DOCS}
}
