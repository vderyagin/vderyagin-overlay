# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A tool for building and distributing development environments"
HOMEPAGE="https://vagrantup.com"
SRC_URI="https://releases.hashicorp.com/vagrant/${PV}/vagrant_${PV}_linux_amd64.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

RDEPEND=""
DEPEND="${RDEPEND}"

src_unpack() {
	mkdir "${S}"
	cd "${S}"
	unpack ${A}
}

src_install() {
	into /opt
	dobin vagrant
}
