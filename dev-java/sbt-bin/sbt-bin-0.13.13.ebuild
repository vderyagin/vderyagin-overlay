# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Build tool for Scala and Java projects that aims to do the basics well"
HOMEPAGE="http://scala-sbt.org"
SRC_URI="https://dl.bintray.com/sbt/native-packages/sbt/${PV}/sbt-${PV}.tgz"
RESTRICT="mirror"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

RDEPEND="virtual/jre:*"

src_unpack() {
	unpack ${A}
	mv sbt* "${S}"
}

src_install() {
	insinto /opt
	doins bin/sbt-launch.jar

	into /opt
	dobin "${FILESDIR}/"{sbt,screpl,scalas}
}
