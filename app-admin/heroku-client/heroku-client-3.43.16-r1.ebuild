# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="A CLI interface to the Heroku Platform API"
HOMEPAGE="https://toolbelt.heroku.com"
SRC_URI="https://www.dropbox.com/s/3to3murczwnmi8w/${P}.tgz"
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
