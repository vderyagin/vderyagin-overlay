# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Tools and libraries for creation and managing resources on Google Cloud Platform"
HOMEPAGE="https://cloud.google.com/sdk"
SRC_URI="
	amd64? ( https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/${P}-linux-x86_64.tar.gz )
	x86?   ( https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/${P}-linux-x86.tar.gz )
"
RESTRICT="mirror"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

RDEPEND="dev-lang/python:2.7"
DEPEND="${RDEPEND}"

DOCS="README RELEASE_NOTES"

src_unpack() {
	unpack ${A}
	mv "${PN}" "${P}"
}

src_compile() {
	CLOUDSDK_CORE_DISABLE_PROMPTS=1 \
	CLOUDSDK_PYTHON=python2 \
	./install.sh \
		--path-update false \
		--bash-completion false
}

src_install() {
	default
	doman help/man/man1/*

	dodir "/usr/share/${PN}"
	cp --archive "${S}"/{.install,bin,lib,platform} "${D}/usr/share/${PN}"

	for executable in bq dev_appserver.py gcloud git-credential-gcloud.sh gsutil; do
		dosym "/usr/share/${PN}/bin/${executable}" "/usr/bin/${executable}"
	done

	newenvd "${FILESDIR}/${PN}-CLOUDSDK_PYTHON.env" "73${PN}"
}