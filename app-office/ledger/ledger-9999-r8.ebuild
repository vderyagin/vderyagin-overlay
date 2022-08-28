# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="A double-entry accounting system with a command-line reporting interface"
HOMEPAGE="http://ledger-cli.org"
EGIT_REPO_URI="https://github.com/ledger/ledger.git"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
SLOT="0"

RDEPEND="
	>=dev-libs/boost-1.49
	>=dev-libs/gmp-4.2.2:*
	>=dev-libs/mpfr-2.4.0:*
"

DEPEND="${RDEPEND}"

DOCS="README.md INSTALL.md NEWS.md CONTRIBUTING.md doc/GLOSSARY.md"

src_configure() {
	./acprep --no-python --prefix="${EPREFIX}/usr"
}

src_compile() {
	default
	emake doc
	makeinfo doc/*.texi
}

src_install() {
	einstalldocs
	doinfo ledger*.info*
	default
}
