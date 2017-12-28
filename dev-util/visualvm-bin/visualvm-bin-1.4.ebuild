# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Visual tool integrating commandline JDK tools and profiling capabilities"
HOMEPAGE="http://visualvm.java.net"
SRC_URI="https://github.com/visualvm/visualvm.src/releases/download/1.4/visualvm_14.zip"

RESTRICT="mirror"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

RDEPEND="virtual/jdk:*"
DEPEND="sys-apps/findutils"

src_unpack() {
	unpack ${A}
	mv visualvm_14 "${S}"
}

src_prepare() {
	default

	rm --recursive "${S}/profiler/lib/deployed"
	find "${S}" -iname '*.dll' -or -iname '*.exe' -exec rm {} \;

	sed "30 ivisualvm_jdkhome=\$JDK_HOME" --in-place bin/visualvm || die
}

src_install() {
	dodir "/opt/${PN}"
	cp --archive "${S}"/{bin,etc,platform,profiler,visualvm} "${D}/opt/${PN}"
	dosym  "${D}/opt/${PN}/bin/visualvm" "/opt/bin/visualvm"
}
