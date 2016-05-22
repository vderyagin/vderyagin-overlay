# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Visual tool integrating commandline JDK tools and profiling capabilities"
HOMEPAGE="http://visualvm.java.net"
SRC_URI="https://java.net/projects/visualvm/downloads/download/release138/visualvm_138.zip"
RESTRICT="mirror"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

RDEPEND="virtual/jdk:*"

src_unpack() {
	unpack ${A}
	mv visualvm_138 "${S}"
}

src_prepare() {
	rm --recursive "${S}/profiler/lib/deployed"
	rm "${S}"/**/*.{exe,dll}

	sed "30 ivisualvm_jdkhome=\$JDK_HOME" --in-place bin/visualvm || die
}

src_install() {
	dodir "/opt/${PN}"
	cp --archive "${S}"/{bin,etc,platform,profiler,visualvm} "${D}/opt/${PN}"
	dosym  "/opt/${PN}/bin/visualvm" "/opt/bin/visualvm"
}
