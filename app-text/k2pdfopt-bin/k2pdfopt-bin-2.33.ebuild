# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="K2pdfopt optimizes PDF/DJVU files for mobile e-readers (e.g. the Kindle) and smartphones"
HOMEPAGE="http://www.willus.com/k2pdfopt"
SRC_URI="
	amd64? ( https://googledrive.com/host/0B1NdDtEdfiQpflc4VFVMelBBRWJGb2x4bEFQdTVSZTZuOWpDWFZuTFNwVkoybjNfNVZLdUE/${PN}_amd64-${PV}.tar.gz )
	x86?   ( https://googledrive.com/host/0B1NdDtEdfiQpflc4VFVMelBBRWJGb2x4bEFQdTVSZTZuOWpDWFZuTFNwVkoybjNfNVZLdUE/${PN}_x86-${PV}.tar.gz )
"
RESTRICT="mirror"

LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

src_unpack() {
	mkdir "${S}"
	cd "${S}"
	unpack ${A}
}

src_install() {
	into /opt
	dobin k2pdfopt
}
