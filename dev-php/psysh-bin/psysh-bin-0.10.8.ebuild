# Copyright 2019-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A runtime developer console, interactive debugger and REPL for PHP"
HOMEPAGE="https://psysh.org"

SRC_URI="https://github.com/bobthecow/psysh/releases/download/v${PV}/psysh-v${PV}.tar.gz -> ${P}-amd64.tar.gz"
RESTRICT="mirror"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

src_unpack() {
	mkdir "${S}"
	cd "${S}"
	unpack ${A}
}

src_install() {
	into /opt
	dobin psysh
}
