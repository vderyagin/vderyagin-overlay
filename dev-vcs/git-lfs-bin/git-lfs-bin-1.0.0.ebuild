# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Git extension for versioning large files"
HOMEPAGE="https://git-lfs.github.com"
SRC_URI="
	amd64? ( https://github.com/github/git-lfs/releases/download/v${PV}/git-lfs-linux-amd64-${PV}.tar.gz )
	x86?   ( https://github.com/github/git-lfs/releases/download/v${PV}/git-lfs-linux-386-${PV}.tar.gz )
"

RESTRICT="mirror"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

RDEPEND="dev-vcs/git"

src_unpack() {
	unpack ${A}
	mv */ ${P}
}

src_install() {
	into /opt
	dobin git-lfs
}
