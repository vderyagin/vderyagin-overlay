# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Secure tunnels to localhost"
HOMEPAGE="https://ngrok.com"
SRC_URI="
	amd64? ( https://drive.google.com/uc?export=download&id=0B1NdDtEdfiQpZjFQSzhXRGdRd2c -> ${P}-amd64.zip )
	x86?   ( https://drive.google.com/uc?export=download&id=0B1NdDtEdfiQpYTJ4MkpaSlJRRzg -> ${P}-x86.zip )
	arm?   ( https://drive.google.com/uc?export=download&id=0B1NdDtEdfiQpQjRuanc0ZWVSUzQ -> ${P}-arm.zip )
"
RESTRICT="mirror"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86 ~arm"
SLOT="0"
IUSE=""

src_unpack() {
	mkdir "${S}"
	cd "${S}"
	unpack ${A}
}

src_install() {
	into /opt
	dobin ngrok
}
