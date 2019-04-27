# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="A general purpose messaging, notification and menuing program for X11"
HOMEPAGE="https://github.com/robm/dzen"
EGIT_REPO_URI="https://github.com/robm/dzen.git"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
SLOT="2"
IUSE="+xinerama +xpm +gadgets +xft"

RDEPEND="
	x11-libs/libX11
	xft? ( x11-libs/libXft )
	xinerama? ( x11-libs/libXinerama )
	xpm? ( x11-libs/libXpm )
"
DEPEND="
	${RDEPEND}
	virtual/pkgconfig
	x11-base/xorg-proto
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

	if use xft ; then
		sed -e '/^LIBS/s|$| $(shell ${PKG_CONFIG} --libs xft)|' \
			-e '/^CFLAGS/s|$| -DDZEN_XFT $(shell ${PKG_CONFIG} --cflags xft)|' \
			-i config.mk || die
	fi
}

src_compile() {
	default
	use gadgets && emake -C gadgets
}

src_install() {
	einstalldocs

	emake PREFIX="/usr" DESTDIR="${D}" install

	if use gadgets ; then
		emake -C gadgets PREFIX="/usr" DESTDIR="${D}" install
		dobin gadgets/*.sh
		dodoc -r gadgets
	fi
}
