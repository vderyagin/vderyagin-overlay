# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="A double-entry accounting system with a command-line reporting interface"
HOMEPAGE="http://ledger-cli.org"
EGIT_REPO_URI="https://github.com/ledger/ledger.git"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="python"

RDEPEND="
	>=dev-libs/boost-1.49[python?]
	>=dev-libs/gmp-4.2.2:*
	>=dev-libs/mpfr-2.4.0:*
	python? ( dev-lang/python:2.7 )
"

DEPEND="${RDEPEND}"

DOCS="README.md INSTALL.md CONTRIBUTING.md doc/GLOSSARY.md doc/NEWS.md"

src_configure() {
	if use python; then
		python_flag=--python
	else
		python_flag=--no-python
	fi

	./acprep ${python_flag} --prefix="${ROOT}usr"
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
