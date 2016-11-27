# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Keyboard layout switcher"
HOMEPAGE="http://rus.akshaal.info/2005/11/blog-post.html"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="x11-base/xorg-x11"

RDEPEND="
	${DEPEND}
	x11-apps/xprop
	x11-misc/wmutils
	x11-misc/xdotool
"

src_unpack() {
	mkdir "${S}"
	cp "${FILESDIR}/${PN}.c" "${S}"
	cp "${FILESDIR}/switch_keyboard_layout" "${S}"
}

src_compile() {
	gcc -L/usr/X11R6/lib -lX11 -o "${PN}" "${PN}.c"
}

src_install() {
	dobin "${PN}" switch_keyboard_layout
}
