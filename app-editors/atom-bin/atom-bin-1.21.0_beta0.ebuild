# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="A hackable text editor for the 21st Century"
HOMEPAGE="https://atom.io"
SRC_URI="https://github.com/atom/atom/releases/download/v1.21.0-beta0/atom-amd64.tar.gz -> ${P}.tar.gz"

RESTRICT="mirror"
LICENSE="MIT"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""

RDEPEND=""
DEPEND="
	dev-lang/python:2.7
	dev-libs/libgcrypt:0/20
	dev-libs/nss
	dev-vcs/git
	gnome-base/gconf:2
	gnome-base/gvfs
	sys-libs/libcap
	virtual/libudev:0/1
	x11-libs/gtk+:2
	x11-libs/libXtst
	x11-libs/libnotify
	x11-misc/xdg-utils
"

src_unpack() {
	unpack ${A}
	mv atom-* "${S}"
}

src_install() {
	dodir "/opt/${PN}"

	cp --archive "${S}/"* "${D}/opt/${PN}"
	dosym "${D}/opt/${PN}/atom" "/opt/bin/atom"
}
