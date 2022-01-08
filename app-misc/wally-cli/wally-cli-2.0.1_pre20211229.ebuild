# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module
EGIT_COMMIT=6d65e2fac8c0b0ce6b582d4b5f3e572d2b531d16

DESCRIPTION="Flash your ZSA Keyboard the EZ way"
HOMEPAGE="https://ergodox-ez.com/pages/wally"

EGO_SUM=(
	"github.com/briandowns/spinner v1.18.0"
	"github.com/briandowns/spinner v1.18.0/go.mod"
	"github.com/fatih/color v1.7.0"
	"github.com/fatih/color v1.7.0/go.mod"
	"github.com/google/gousb v2.1.0+incompatible"
	"github.com/google/gousb v2.1.0+incompatible/go.mod"
	"github.com/marcinbor85/gohex v0.0.0-20200531163658-baab2527a9a2"
	"github.com/marcinbor85/gohex v0.0.0-20200531163658-baab2527a9a2/go.mod"
	"github.com/mattn/go-colorable v0.1.2"
	"github.com/mattn/go-colorable v0.1.2/go.mod"
	"github.com/mattn/go-isatty v0.0.8"
	"github.com/mattn/go-isatty v0.0.8/go.mod"
	"github.com/mattn/go-runewidth v0.0.9"
	"github.com/mattn/go-runewidth v0.0.9/go.mod"
	"golang.org/x/sys v0.0.0-20190222072716-a9d3bda3a223/go.mod"
	"golang.org/x/sys v0.0.0-20200923182605-d9f96fdee20d"
	"golang.org/x/sys v0.0.0-20200923182605-d9f96fdee20d/go.mod"
	"gopkg.in/cheggaaa/pb.v1 v1.0.28"
	"gopkg.in/cheggaaa/pb.v1 v1.0.28/go.mod"
)

GO_DEPEND=">=dev-lang/go-1.14"

go-module_set_globals
SRC_URI="https://github.com/zsa/wally-cli/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"

RDEPEND="virtual/libusb:1"
DEPEND="${RDEPEND}"

S=${WORKDIR}/wally-cli-${EGIT_COMMIT}

DOCS="README.md"

src_compile() {
	go build
}

src_install() {
	einstalldocs
	dobin ${PN}
}

pkg_postinst() {
	elog "Add your user to the plugdev group to be able to use ${PN}"
}
