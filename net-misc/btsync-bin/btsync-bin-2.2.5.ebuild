# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Peer-to-peer file synchronisation tool using BitTorrent protocol."
HOMEPAGE="https://getsync.com"
SRC_URI="
	amd64? ( https://googledrive.com/host/0B1NdDtEdfiQpflc4VFVMelBBRWJGb2x4bEFQdTVSZTZuOWpDWFZuTFNwVkoybjNfNVZLdUE/BitTorrent-Sync_x64-${PV}.tar.gz )
	x86?   ( https://googledrive.com/host/0B1NdDtEdfiQpflc4VFVMelBBRWJGb2x4bEFQdTVSZTZuOWpDWFZuTFNwVkoybjNfNVZLdUE/BitTorrent-Sync_i386-${PV}.tar.gz )
	arm?   ( https://googledrive.com/host/0B1NdDtEdfiQpflc4VFVMelBBRWJGb2x4bEFQdTVSZTZuOWpDWFZuTFNwVkoybjNfNVZLdUE/BitTorrent-Sync_arm-${PV}.tar.gz )
"
RESTRICT="mirror"

LICENSE="btsync"
KEYWORDS="~amd64 ~x86 ~arm"
SLOT="0"
IUSE=""

DOCS="README"

src_unpack() {
	mkdir "${S}"
	cd "${S}"
	unpack ${A}
}

src_install() {
	default
	into /opt
	dobin btsync
	newconfd "${FILESDIR}/btsync.conf" btsync
	newinitd "${FILESDIR}/btsync.initd" btsync
}

pkg_postinst() {
	elog ""
	elog "To use BitTorrent Sync you need to create a configuration file:"
	elog "btsync --dump-sample-config > ~/.btsync.conf"
	elog "Set \"storage_path\" option there to existing directory"
	elog ""
	elog "List of user accounts for which BitTorrent Sync will be launched "
	elog "can be set in /etc/conf.d/btsync"
	elog ""
}
