# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3

DESCRIPTION="Personal storage system for life"
HOMEPAGE="http://camlistore.org"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"
SLOT="0"

IUSE=""

DEPEND=">=dev-lang/go-1.1"

EGIT_REPO_URI="https://github.com/camlistore/camlistore.git"

src_compile() {
	go run make.go || die "build failed"
}

src_install() {
	cd bin
	dobin camdeploy camget camlistored cammount camput camtool devcam hello publisher
}
