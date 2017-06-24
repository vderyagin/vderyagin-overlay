# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="A CLI interface to the Heroku Platform API"
HOMEPAGE="https://toolbelt.heroku.com"
SRC_URI="https://www.dropbox.com/s/d48dug2gxp4o5l6/${P}.tgz"
RESTRICT="mirror"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

RDEPEND="dev-lang/ruby:*"

src_unpack() {
	unpack ${A}
	mv "${PN}" "${S}"
}

src_install() {
	dodir "/usr/share/${PN}"
	cp --archive "${S}"/{bin,data,lib,vendor} "${D}/usr/share/${PN}"
	dosym "/usr/share/${PN}/bin/heroku" /usr/bin/heroku
}
