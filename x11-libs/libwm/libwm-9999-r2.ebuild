# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="A small library for X windows manipulation"
HOMEPAGE="https://github.com/wmutils/libwm"
EGIT_REPO_URI="https://github.com/wmutils/libwm.git"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="x11-libs/libxcb"
RDEPEND="${DEPEND}"

DOCS="README.md"

src_install() {
	einstalldocs
	emake PREFIX="/usr" DESTDIR="${D}" install
}
