# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="A command-line fuzzy finder written in Go"
HOMEPAGE="https://github.com/junegunn/fzf"
SRC_URI="
	amd64? ( https://github.com/junegunn/fzf-bin/releases/download/${PV}/fzf-${PV}-linux_amd64-static.tgz )
	x86?   ( https://github.com/junegunn/fzf-bin/releases/download/${PV}/fzf-${PV}-linux_386.tgz )
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	mkdir "${S}"
	cd "${S}"
	unpack ${A}
	mv fzf-* fzf
}

src_install() {
	into /opt
	dobin fzf
}
