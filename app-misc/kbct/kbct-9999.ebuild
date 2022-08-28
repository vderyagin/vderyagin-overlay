# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 cargo

DESCRIPTION="Keyboard keycode mapping utility for Linux supporting layered configuration"
HOMEPAGE="https://github.com/samvel1024/kbct"
EGIT_REPO_URI="https://github.com/samvel1024/kbct.git"

LICENSE="public-domain"
SLOT="0"
RESTRICT="mirror"

RDEPEND="virtual/udev"
DEPEND="${RDEPEND}"

DOCS=(
	readme.md
	examples.md
)

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_configure() {
	cargo_src_configure
}

src_compile() {
	cargo_src_compile
}

src_install() {
	cargo_src_install

	newinitd "${FILESDIR}"/kbct.rc9 kbct

	insinto /etc
	doins "${FILESDIR}/kbct.yaml"

	einstalldocs
}
