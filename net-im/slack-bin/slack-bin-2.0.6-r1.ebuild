# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit unpacker

DESCRIPTION="A messaging app for teams"
HOMEPAGE="https://slack.com"
SRC_URI="
	amd64? ( https://downloads.slack-edge.com/linux_releases/slack-desktop-${PV}-amd64.deb )
	x86?   ( https://downloads.slack-edge.com/linux_releases/slack-desktop-${PV}-i386.deb )
"

LICENSE="Slack"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"

DEPEND=""
RDEPEND="
	>=gnome-base/gconf-3.2.6-r4
	>=gnome-base/libgnome-keyring-3.12.0
	>=x11-libs/libXScrnSaver-1.2.2-r1
"

src_unpack() {
	unpack_deb ${A}
	mv usr "${P}"
}

src_install(){
	dodir "/opt/${PN}"
	cp --archive "${S}"/lib/slack/* "${D}/opt/${PN}"
	dosym "/opt/${PN}/slack" "/opt/bin/slack"
}
