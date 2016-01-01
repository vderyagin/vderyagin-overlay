# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3

DESCRIPTION="Safe and simple one-script git synchronization"
HOMEPAGE="https://github.com/simonthum/git-sync"
EGIT_REPO_URI="https://github.com/simonthum/git-sync.git"

LICENSE="CC0-1.0"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

RDEPEND="dev-vcs/git"

DOCS="README.md"

src_install() {
	dobin ${PN}
	dodoc ${DOCS}
}
