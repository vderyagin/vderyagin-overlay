# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Crappy messaging application"
HOMEPAGE="https://viber.com"
SRC_URI="https://download.cdn.viber.com/desktop/Linux/viber.AppImage -> ${P}"

LICENSE="viber"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

RDEPEND=""
DEPEND="${RDEPEND}"

src_unpack() {
	mkdir "${S}"
	cd "${S}"
	cp --dereference "${DISTDIR}/${A}" viber
}

src_install() {
	into /opt
	dobin viber
}
