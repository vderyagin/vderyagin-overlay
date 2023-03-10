# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools git-r3

DESCRIPTION="X11 screen lock utility with security in mind"
HOMEPAGE="https://github.com/google/xsecurelock"
EGIT_REPO_URI="https://github.com/google/xsecurelock.git"

LICENSE="Apache-2.0"
SLOT="0"
IUSE="mplayer +mpv xscreensaver"

RDEPEND="
	dev-libs/libbsd
	media-libs/fontconfig
	media-libs/freetype
	sys-apps/util-linux
	sys-libs/pam
	x11-libs/libX11
	x11-libs/libXcomposite
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXft
	x11-libs/libXmu
	x11-libs/libXrandr
	x11-libs/libXScrnSaver
	xscreensaver? ( x11-misc/xscreensaver )
	mpv? ( media-video/mpv )
	mplayer? ( media-video/mplayer )
"
DEPEND="${RDEPEND}
	x11-base/xorg-proto
"

BDEPEND="virtual/pkgconfig"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	local myeconfargs=(
		--prefix="${EPREFIX}"/usr
		--with-default-auth-module=auth_x11
		--with-default-authproto-module=authproto_pam
		--without-htpasswd
		--without-pamtester
		--without-pandoc
		--with-pam-service-name=system-auth
	)

	if ! use mpv ; then
		myeconfargs+=(
			--without-mpv
		)
	fi

	if ! use mplayer ; then
		myeconfargs+=(
			--without-mplayer
		)
	fi

	if use xscreensaver ; then
		myeconfargs+=(
			--with-default-saver-module=saver_xscreensaver
			--with-xscreensaver="${EPREFIX}"/usr/$(get_libdir)/misc/xscreensaver
		)
	else
		myeconfargs+=(
			--with-default-saver-module=saver_blank
			--without-xscreensaver
		)
	fi

	econf "${myeconfargs[@]}"
}
