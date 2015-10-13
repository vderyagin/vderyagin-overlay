# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3

DESCRIPTION="CLI application for renaming numbered files"
HOMEPAGE="https://gitlab.com/vderyagin/rnm"
EGIT_REPO_URI="https://gitlab.com/vderyagin/rnm.git"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND="dev-util/cargo"
RDEPEND=""

src_compile() {
	cargo build --release || die "build failed"
}

src_install() {
	dobin "target/release/${PN}"
}
