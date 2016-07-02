# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Cloud-based mobile and desktop messaging app with a focus on security and speed"
HOMEPAGE="https://telegram.org"
SRC_URI="
	amd64? ( https://updates.tdesktop.com/tlinux/tsetup.${PV}.tar.xz )
	x86?   ( https://updates.tdesktop.com/tlinux32/tsetup32.${PV}.tar.xz )
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"

src_unpack() {
	unpack ${A}
	mv Telegram "${S}"
}

src_install() {
	into /opt
	newbin Telegram telegram
}
