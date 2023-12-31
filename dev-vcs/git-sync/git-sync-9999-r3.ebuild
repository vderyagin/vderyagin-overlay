# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Safe and simple one-script git synchronization"
HOMEPAGE="https://github.com/simonthum/git-sync"
EGIT_REPO_URI="https://github.com/simonthum/git-sync.git"

LICENSE="CC0-1.0"
SLOT="0"

RDEPEND="dev-vcs/git"

DOCS="README.md"

src_install() {
	einstalldocs
	dobin ${PN}
}
