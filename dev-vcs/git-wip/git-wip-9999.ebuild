# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3

DESCRIPTION="Help track git Work In Progress branches"
HOMEPAGE="http://www.jukie.net/~bart/blog/save-everything-with-git-wip"
EGIT_REPO_URI="https://github.com/bartman/git-wip.git"

LICENSE="GPL-2+"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

RDEPEND="dev-vcs/git"

DOCS="README.markdown"

src_install() {
	dobin ${PN}
	dodoc ${DOCS}
}
