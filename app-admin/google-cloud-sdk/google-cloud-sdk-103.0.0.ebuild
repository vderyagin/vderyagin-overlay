# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Tools and libraries for creation and managing resources on Google Cloud Platform"
HOMEPAGE="https://cloud.google.com/sdk"
SRC_URI="https://googledrive.com/host/0B1NdDtEdfiQpflc4VFVMelBBRWJGb2x4bEFQdTVSZTZuOWpDWFZuTFNwVkoybjNfNVZLdUE/${P}.tar.gz"
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
	dodir "/usr/share/${PN}"
	cp -R */ .*/ "${D}/usr/share/${PN}"

	for executable in bq gcloud git-credential-gcloud.sh gsutil; do
		dosym "/usr/share/${PN}/bin/${executable}" "/usr/bin/${executable}"
	done

	newenvd "${FILESDIR}/${PN}-CLOUDSDK_PYTHON.env" "73${PN}"
	dodoc ${DOCS}
}
