# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Secure tunnels to localhost"
HOMEPAGE="https://ngrok.com"
SRC_URI="
	amd64? ( https://dl.ngrok.com/ngrok_${PV}_linux_amd64.zip )
	x86?   ( https://dl.ngrok.com/ngrok_${PV}_linux_386.zip )
	arm?   ( https://dl.ngrok.com/ngrok_${PV}_linux_arm.zip )
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
