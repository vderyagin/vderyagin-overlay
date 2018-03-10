# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="Personal storage system for life"
HOMEPAGE="http://perkeep.org"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"
SLOT="0"

IUSE=""

DEPEND="
	>=dev-lang/go-1.8
	<dev-lang/go-1.10
"

EGIT_REPO_URI="https://github.com/perkeep/perkeep.git"

src_compile() {
	go run make.go || die "build failed"
}

src_install() {
	dobin bin/{camget,camlistored,camput,devcam,pk,pk-deploy,pk-mount,publisher,scancab}

	newconfd "${FILESDIR}/camlistored.conf" camlistored
	newinitd "${FILESDIR}/camlistored.initd" camlistored
}

pkg_postinst() {
	elog ""
	elog "List of user accounts for which Perkeep daemon will be launched"
	elog "can be set in /etc/conf.d/camlistored"
	elog ""
}
