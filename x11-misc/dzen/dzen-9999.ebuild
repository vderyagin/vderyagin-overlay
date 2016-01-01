# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3

DESCRIPTION="A general purpose messaging, notification and menuing program for X11"
HOMEPAGE="https://github.com/robm/dzen"
EGIT_REPO_URI="https://github.com/robm/dzen.git"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="+xinerama +xpm +gadgets"

RDEPEND="
	x11-libs/libX11
	xinerama? ( x11-libs/libXinerama )
	xpm? ( x11-libs/libXpm )
"
DEPEND="
	${RDEPEND}
	virtual/pkgconfig
	x11-proto/xproto
	xinerama? ( x11-proto/xineramaproto )
"

DOCS="README CREDITS"

src_configure() {
	if use xinerama ; then
		sed -e '/^LIBS/s|$| -lXinerama|' \
			-e '/^CFLAGS/s|$| -DDZEN_XINERAMA|' \
			-i config.mk || die
	fi
	if use xpm ; then
		sed -e '/^LIBS/s|$| -lXpm|' \
			-e '/^CFLAGS/s|$| -DDZEN_XPM|' \
			-i config.mk || die
	fi
}

src_compile() {
	default
	use gadgets && emake -C gadgets
}

src_install() {
	emake PREFIX="/usr" DESTDIR="${D}" install

	if use gadgets ; then
		emake -C gadgets PREFIX="/usr" DESTDIR="${D}" install
		dobin gadgets/*.sh
		dodoc gadgets/README*
	fi
}
