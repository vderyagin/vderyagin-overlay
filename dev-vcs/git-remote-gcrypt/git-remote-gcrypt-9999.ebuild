# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3

DESCRIPTION="A git remote helper for GPG-encrypted remotes."
HOMEPAGE="https://github.com/joeyh/git-remote-gcrypt"
SRC_URI=""
EGIT_REPO_URI="https://github.com/joeyh/git-remote-gcrypt"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	net-misc/rsync
	net-misc/curl
	app-crypt/gnupg
	dev-vcs/git
"

DEPEND="dev-python/docutils"

src_install() {
	DESTDIR="${D}" prefix="${EPREFIX}/usr" ./install.sh || die "installation failed"
	rst2man.py README.rst > git-remote-gcrypt.1
	doman git-remote-gcrypt.1
}
