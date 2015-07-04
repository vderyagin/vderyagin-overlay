# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3

DESCRIPTION="Set of window manipulation tools"
HOMEPAGE="https://github.com/wmutils/core"
EGIT_REPO_URI="https://github.com/wmutils/core.git"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

RDEPEND="x11-libs/libxcb"
DEPEND="${RDEPEND}"

DOCS="README.md"

src_install() {
	emake MANPREFIX="${ROOT}/usr/share/man" DESTDIR="${D}" install
	dodoc ${DOCS}
}