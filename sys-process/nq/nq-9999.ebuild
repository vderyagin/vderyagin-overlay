# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3

DESCRIPTION="Unix command line queue utility"
HOMEPAGE="https://github.com/chneukirchen/nq"
EGIT_REPO_URI="https://github.com/chneukirchen/nq.git"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="zsh-completion"

DEPEND=""
RDEPEND="${DEPEND}"

DOCS="README.md"

src_install() {
	emake PREFIX="${D}/usr" install
	dodoc $DOCS

	if use zsh-completion ; then
		insinto /usr/share/zsh/site-functions
		doins _fq
	fi
}
