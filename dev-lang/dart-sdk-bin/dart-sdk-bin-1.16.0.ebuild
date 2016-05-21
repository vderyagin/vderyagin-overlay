# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="The Dart SDK, including the VM, dart2js, core libraries, and more"
HOMEPAGE="https://dartlang.org"
SRC_URI="
	amd64? ( https://storage.googleapis.com/dart-archive/channels/stable/release/${PV}/sdk/dartsdk-linux-x64-release.zip  -> ${P}-x64.zip )
	x86?   ( https://storage.googleapis.com/dart-archive/channels/stable/release/${PV}/sdk/dartsdk-linux-ia32-release.zip -> ${P}-ia32.zip )
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

src_prepare() {
	chmod a+x bin/*
}

src_install() {
	dodir "/opt/${PN}"
	cp -R */ "${D}/opt/${PN}"

	for executable in dart dart2js dartanalyzer dartdevc dartdoc dartfmt pub; do
		dosym "/opt/${PN}/bin/${executable}" "/opt/bin/${executable}"
	done

	dodoc ${DOCS}
}
