# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="A CLI interface to the Heroku Platform API"
HOMEPAGE="https://toolbelt.heroku.com"
SRC_URI="https://googledrive.com/host/0B1NdDtEdfiQpflc4VFVMelBBRWJGb2x4bEFQdTVSZTZuOWpDWFZuTFNwVkoybjNfNVZLdUE/${P}.tgz"
RESTRICT="mirror"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

RDEPEND="dev-lang/ruby:*"

src_unpack() {
	unpack ${A}
	mv */ "${S}"
}

src_install() {
	dodir "/usr/share/${PN}"
	cp -R */ "${D}/usr/share/${PN}"
	dosym "/usr/share/${PN}/bin/heroku" /usr/bin/heroku
}
