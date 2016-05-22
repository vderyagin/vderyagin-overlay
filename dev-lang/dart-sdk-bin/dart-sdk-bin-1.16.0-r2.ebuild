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
	mv dart-sdk "${S}"
}

src_prepare() {
	chmod a+x "${S}"/bin/{dart,dart2js,dartanalyzer,dartdevc,dartdoc,dartfmt,pub}
}

src_install() {
	default

	dodir "/usr/share/${PN}"
	cp --archive "${S}"/{bin,lib,util} "${D}/usr/share/${PN}"

	dodir "/usr/include/${PN}"
	cp --archive "${S}"/include/*.h "${D}/usr/include/${PN}"

	for executable in dart dart2js dartanalyzer dartdevc dartdoc dartfmt pub; do
		dosym "/usr/share/${PN}/bin/${executable}" "/usr/bin/${executable}"
	done
}
