# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Automated installer tool for Rockbox"
HOMEPAGE="http://www.rockbox.org/wiki/RockboxUtility"
SRC_URI="
	amd64? ( http://download.rockbox.org/rbutil/linux/RockboxUtility-v${PV}-64bit.tar.bz2 )
	x86?   ( http://download.rockbox.org/rbutil/linux/RockboxUtility-v${PV}.tar.bz2 )
"
RESTRICT="mirror"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86 ~arm"
SLOT="0"
IUSE=""

src_unpack() {
	unpack ${A}
	mv $(basename ${A} .tar.bz2) "${S}"
}

src_install() {
	into /opt
	dobin RockboxUtility
}
