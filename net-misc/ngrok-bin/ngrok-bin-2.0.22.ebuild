# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Secure tunnels to localhost"
HOMEPAGE="https://ngrok.com"
SRC_URI="
	amd64? ( https://googledrive.com/host/0B1NdDtEdfiQpflc4VFVMelBBRWJGb2x4bEFQdTVSZTZuOWpDWFZuTFNwVkoybjNfNVZLdUE/ngrok-stable-linux-amd64-${PV}.zip )
	x86?   ( https://googledrive.com/host/0B1NdDtEdfiQpflc4VFVMelBBRWJGb2x4bEFQdTVSZTZuOWpDWFZuTFNwVkoybjNfNVZLdUE/ngrok-stable-linux-386-${PV}.zip )
	arm?   ( https://googledrive.com/host/0B1NdDtEdfiQpflc4VFVMelBBRWJGb2x4bEFQdTVSZTZuOWpDWFZuTFNwVkoybjNfNVZLdUE/ngrok-stable-linux-arm-${PV}.zip )
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
