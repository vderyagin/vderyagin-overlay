# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Unix command line queue utility"
HOMEPAGE="https://github.com/leahneukirchen/nq"
EGIT_REPO_URI="https://github.com/leahneukirchen/nq.git"

LICENSE="public-domain"
SLOT="0"
IUSE="zsh-completion"

DOCS="README.md"

src_install() {
	einstalldocs
	emake PREFIX="${D}/usr" install

	if use zsh-completion ; then
		insinto /usr/share/zsh/site-functions
		doins _nq
	fi
}
