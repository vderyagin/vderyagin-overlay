# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Tools for interfacing with copy.com"
HOMEPAGE="http://copy.com"
SRC_URI="https://googledrive.com/host/0B1NdDtEdfiQpflc4VFVMelBBRWJGb2x4bEFQdTVSZTZuOWpDWFZuTFNwVkoybjNfNVZLdUE/${P}.tar.gz"
RESTRICT="mirror"

LICENSE="public-domain"
KEYWORDS="~amd64 ~x86 ~arm"
SLOT="0"
IUSE=""

DOCS="README"

src_install() {
	if use x86; then
		subdir=x86
	elif use amd64; then
		subdir=x86_64
	elif use arm; then
		subdir=armv6h
	else
		die "unsupported architecture"
	fi

	dodir "/opt/${P}"
	cp -R ${subdir}/* "${D}/opt/${P}"

	newenvd "${FILESDIR}/${P}-PATH.env" "82${PN}"
	dodoc ${DOCS}
}
