# Copyright 2021-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Encrypted overlay filesystem written in Go"
HOMEPAGE="https://nuetzlich.net/gocryptfs"
SRC_URI="https://github.com/rfjakob/gocryptfs/releases/download/v${PV}/gocryptfs_v${PV}_linux-static_amd64.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

RDEPEND="sys-fs/fuse"

src_unpack() {
	mkdir "${S}"
	cd "${S}"
	unpack ${A}
}

src_install() {
	into /opt
	doman gocryptfs.1 gocryptfs-xray.1
	dobin gocryptfs gocryptfs-xray
}
