# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Set of window manipulation tools"
HOMEPAGE="https://github.com/wmutils/core"
EGIT_REPO_URI="https://github.com/wmutils/core.git"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

RDEPEND="
	x11-libs/libxcb
	x11-libs/libwm
"
DEPEND="${RDEPEND}"

DOCS="README.md"

src_install() {
	einstalldocs
	emake PREFIX="/usr" MANPREFIX="${ROOT}/usr/share/man" DESTDIR="${D}" install
}
