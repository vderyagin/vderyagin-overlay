# Copyright 2019-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Secure introspectable tunnels to localhost"
HOMEPAGE="https://ngrok.com"

SRC_URI="https://dropbox.com/s/uefzgov6rlvjo99/ngrok-stable-linux-amd64-${PV}.zip"
RESTRICT="mirror"

LICENSE="Apache-2.0"
KEYWORDS="~amd64"
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
