# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit java-pkg-2

DESCRIPTION="sbt is a build tool for Scala and Java projects that aims to do the basics well"
HOMEPAGE="http://www.scala-sbt.org"
SRC_URI="https://dl.bintray.com/sbt/native-packages/sbt/0.13.8/sbt-0.13.8.tgz"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

RDEPEND="virtual/jre:*"
DEPEND="${RDEPEND}"

src_unpack() {
	unpack ${A}
	mv ${PN} ${P}
}

src_install() {
	java-pkg_dojar "bin/sbt-launch.jar"
	java-pkg_dolauncher sbt --main xsbt.boot.Boot --java_args "-Xms512M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=512M -jar /usr/share/sbt/lib/sbt-launch.jar \"\$@\""
}
