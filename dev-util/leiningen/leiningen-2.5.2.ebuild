# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Tool for automating Clojure projects without setting your hair on fire"
HOMEPAGE="http://leiningen.org"
SRC_URI="https://github.com/technomancy/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"

LICENSE="EPL-1.0"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

RDEPEND="virtual/jdk:*"

DOCS="CONTRIBUTING.md NEWS.md README.md TUTORIAL.md"

src_install() {
	dobin bin/lein
	dodoc ${DOCS}
}
