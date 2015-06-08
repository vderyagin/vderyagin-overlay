# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3

DESCRIPTION="GIT utilities -- repo summary, repl, changelog population, author commit percentages and more"
HOMEPAGE="https://github.com/tj/git-extras"
EGIT_REPO_URI="https://github.com/tj/git-extras.git"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

RDEPEND="dev-vcs/git"

DOCS="AUTHORS Commands.md History.md Installation.md Readme.md"

src_compile() {
	true
}

src_install() {
	emake \
		DESTDIR="${D}" \
		BINPREFIX="/usr/bin" \
		MANPREFIX="/usr/share/man/man1" \
		install

	dodoc ${DOCS}
}
