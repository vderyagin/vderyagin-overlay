# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Manages multiple Processing versions"
HOMEPAGE="https://processing.org"
SRC_URI=""

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-admin/eselect"
RDEPEND="${DEPEND}"

src_unpack() {
	mkdir "${S}"
}

src_install() {
	insinto /usr/share/eselect/modules
	doins "${FILESDIR}/processing.eselect"
}
