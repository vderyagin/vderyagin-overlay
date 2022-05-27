# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Command-line tool that brings code-like linting to prose"
HOMEPAGE="https://docs.errata.ai/vale/about"
SRC_URI="https://github.com/errata-ai/vale/releases/download/v${PV}/vale_${PV}_Linux_64-bit.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

RDEPEND=""
DEPEND="${RDEPEND}"

src_unpack() {
	mkdir "${S}"
	cd "${S}"
	unpack ${A}
}

src_install() {
	into /opt
	dobin vale
}
