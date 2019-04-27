# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Secure tunnels to localhost"
HOMEPAGE="https://ngrok.com"

SRC_URI="
	amd64? ( https://www.dropbox.com/s/82qzm85bupjih3a/ngrok-stable-linux-amd64-${PV}.zip -> ${P}-amd64.zip )
	x86?   ( https://www.dropbox.com/s/m3idzt8ujuqu382/ngrok-stable-linux-386-${PV}.zip -> ${P}-x86.zip )
"
RESTRICT="mirror"

LICENSE="Apache-2.0"
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
	dobin ngrok
}
