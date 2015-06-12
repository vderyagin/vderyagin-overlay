# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit java-pkg-2

DESCRIPTION="Build tool for Scala and Java projects that aims to do the basics well"
HOMEPAGE="http://scala-sbt.org"
SRC_URI="https://dl.bintray.com/sbt/native-packages/sbt/${PV}/${P}.tgz"
RESTRICT="mirror"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

RDEPEND="virtual/jre:*"

src_unpack() {
	unpack ${A}
	mv ${PN} ${P}
}

src_install() {
	java-pkg_dojar "bin/sbt-launch.jar"
	dobin "${FILESDIR}/sbt" "${FILESDIR}/screpl" "${FILESDIR}/scalas"
}
