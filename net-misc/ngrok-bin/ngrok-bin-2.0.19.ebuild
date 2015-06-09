# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Secure tunnels to localhost"
HOMEPAGE="https://ngrok.com"
SRC_URI="
	amd64? ( https://dl.ngrok.com/ngrok_2.0.19_linux_amd64.zip )
	x86?   ( https://dl.ngrok.com/ngrok_2.0.19_linux_amd64.zip )
	arm?   ( https://dl.ngrok.com/ngrok_2.0.19_linux_arm.zip )
"

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
	dobin ngrok
}
