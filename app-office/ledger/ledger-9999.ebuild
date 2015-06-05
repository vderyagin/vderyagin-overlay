# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils git-r3

DESCRIPTION="A double-entry accounting system with a command-line reporting interface"
HOMEPAGE="http://ledger-cli.org"
EGIT_REPO_URI="https://github.com/ledger/ledger.git"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="doc python"

RDEPEND="
	>=dev-libs/boost-1.49[python?]
	>=dev-libs/gmp-4.2.2:*
	>=dev-libs/mpfr-2.4.0:*
	python? ( dev-lang/python:2.7 )
"

DEPEND="
	${RDEPEND}
	doc? (
		>=app-doc/doxygen-1.5.7.1
		>=media-gfx/graphviz-2.20.3
		>=sys-apps/texinfo-4.13
	)
"
