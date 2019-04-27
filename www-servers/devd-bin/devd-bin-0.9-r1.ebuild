# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A http daemon for local development"
HOMEPAGE="https://github.com/cortesi/devd"
SRC_URI="https://github.com/cortesi/devd/releases/download/v${PV}/devd-${PV}-linux64.tgz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

src_unpack() {
	unpack ${A}
	mv devd-*/ "${S}"
}

src_install() {
	into /opt
	dobin devd
}
