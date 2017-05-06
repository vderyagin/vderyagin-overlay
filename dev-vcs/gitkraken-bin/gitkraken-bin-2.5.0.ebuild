# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="GitKraken is the Git client designed to make you a more productive Git user"
HOMEPAGE="https://gitkraken.com"
SRC_URI="https://www.dropbox.com/s/cs02bbzgt2o68p3/${P}.tar.gz"

LICENSE="GitKraken-EULA"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	default
	mv gitkraken "${S}"
}

src_install() {
	dodir "/opt/${PN}"
	cp --archive "${S}"/* "${D}/opt/${PN}/"
	dosym "/opt/${PN}/gitkraken" "/opt/bin/gitkraken"
}
