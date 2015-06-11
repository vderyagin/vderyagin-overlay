# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="A CLI interface to the Heroku Platform API"
HOMEPAGE="https://toolbelt.heroku.com"
SRC_URI="https://github.com/heroku/heroku/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

RDEPEND="dev-lang/ruby:*"

DOCS="CHANGELOG README.md RELEASE.md"

src_unpack() {
	unpack ${A}
	mv */ "${S}"
}

src_install() {
	dodir "/usr/share/${P}"
	cp -R */ "${D}/usr/share/${P}"
	newenvd "${FILESDIR}/${P}-PATH.env" "78${PN}"
	dodoc ${DOCS}
}
