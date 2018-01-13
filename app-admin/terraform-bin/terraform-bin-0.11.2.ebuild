# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Tool for building, changing, and versioning infrastructure"
HOMEPAGE="https://terraform.io"
SRC_URI="
	amd64? ( https://releases.hashicorp.com/terraform/${PV}/terraform_${PV}_linux_amd64.zip )
	x86?   ( https://releases.hashicorp.com/terraform/${PV}/terraform_${PV}_linux_386.zip )
"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
RESTRICT="mirror"

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	mkdir "${S}"
	cd "${S}"
	unpack ${A}
}

src_install() {
	into /opt
	dobin terraform
}
