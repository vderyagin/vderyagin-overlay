# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Secure tunnels to localhost"
HOMEPAGE="https://ngrok.com"
SRC_URI="
	amd64? ( https://www.dropbox.com/s/33n1ftr836tdntt/ngrok-stable-linux-amd64-${PV}.zip -> ${P}-amd64.zip )
	x86?   ( https://www.dropbox.com/s/6ccd4glovfvx3gj/ngrok-stable-linux-386-${PV}.zip -> ${P}-x86.zip )
	arm?   ( https://www.dropbox.com/s/mirfpv0sc6rg85w/ngrok-stable-linux-arm-${PV}.zip -> ${P}-arm.zip )
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
