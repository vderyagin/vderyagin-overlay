# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Perimeter81 Linux agent"
HOMEPAGE="https://perimeter81.com"
SRC_URI="https://www.dropbox.com/s/lm2kcyqqpf2ydp5/Perimeter81.deb"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

# https://gpo.zugaina.org/sys-kernel/dkms
RDEPEND="
	>=dev-libs/nss-3
	>=dev-libs/openssl-1
	gnome-base/gconf:2
	net-analyzer/traceroute
	net-dns/openresolv
	net-firewall/iptables
	net-vpn/wireguard-tool
	sys-apps/net-tools
	sys-kernel/dkms
	x11-libs/libXtst
	x11-libs/libnotify
"

DEPEND="${RDEPEND}"

src_unpack() {
}

src_install() {
}
