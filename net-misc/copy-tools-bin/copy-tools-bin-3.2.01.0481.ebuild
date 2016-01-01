# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Tools for interfacing with copy.com"
HOMEPAGE="http://copy.com"
SRC_URI="https://googledrive.com/host/0B1NdDtEdfiQpflc4VFVMelBBRWJGb2x4bEFQdTVSZTZuOWpDWFZuTFNwVkoybjNfNVZLdUE/${P}.tar.gz"
RESTRICT="mirror"

LICENSE="copy.com"
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

	dodir "/opt/${PN}"
	cp -R ${subdir}/* "${D}/opt/${PN}"

	for tool in Agent Cmd Console; do
		dosym "/opt/${PN}/Copy${tool}" "/opt/bin/Copy${tool}"
	done

	dodoc ${DOCS}
}
