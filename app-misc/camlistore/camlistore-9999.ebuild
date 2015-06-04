# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3

DESCRIPTION="Personal storage system for life"
HOMEPAGE="http://camlistore.org"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""

IUSE=""

DEPEND=">=dev-lang/go-1.1"

EGIT_REPO_URI="https://github.com/camlistore/camlistore.git"

src_compile() {
  go run make.go || die "build failed"
}

src_install() {
	cd bin
	dobin "camdeploy"
	dobin "camget"
	dobin "camlistored"
	dobin "cammount"
	dobin "camput"
	dobin "camtool"
	dobin "devcam"
	dobin "hello"
	dobin "publisher"
}
