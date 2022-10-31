# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module udev
EGIT_COMMIT=b0fafe52cc7fb9d55f2b968d4548c99917c7325c

DESCRIPTION="Flash your ZSA Keyboard the EZ way"
HOMEPAGE="https://ergodox-ez.com/pages/wally"

GO_DEPEND=">=dev-lang/go-1.14"

SRC_URI="
	https://github.com/zsa/wally-cli/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz
	https://lthfubkddme4zc4acplgkbgo-misc.s3.amazonaws.com/${P}-vendor.tar.xz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"

RDEPEND="virtual/libusb:1"
DEPEND="${RDEPEND}"

S=${WORKDIR}/wally-cli-${EGIT_COMMIT}

DOCS="README.md"

src_compile() {
	ego build
}

src_install() {
	einstalldocs
	udev_dorules "${FILESDIR}/50-wally.rules"
	udev_dorules "${FILESDIR}/51-oryx.rules"
	dobin ${PN}
}

pkg_postinst() {
	udev_reload
	elog "Add your user to the plugdev group to be able to use ${PN}"
}

pkg_postrm() {
	udev_reload
}
