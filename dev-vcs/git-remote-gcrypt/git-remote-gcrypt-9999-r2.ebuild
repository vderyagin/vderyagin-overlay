# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="A git remote helper for GPG-encrypted remotes."
HOMEPAGE="https://spwhitton.name/tech/code/git-remote-gcrypt"
SRC_URI=""
EGIT_REPO_URI="https://git.spwhitton.name/git-remote-gcrypt"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="rsync curl +doc"

RDEPEND="
	rsync? ( net-misc/rsync )
	curl? ( net-misc/curl )
	app-crypt/gnupg
	dev-vcs/git
"

DEPEND="doc? ( dev-python/docutils )"

src_install() {
	DESTDIR="${D}" prefix="${EPREFIX}/usr" ./install.sh || die "installation failed"

	if use doc; then
		rst2man.py README.rst > git-remote-gcrypt.1
		doman git-remote-gcrypt.1
	fi
}
