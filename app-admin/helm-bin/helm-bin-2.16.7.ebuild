# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Kubernetes Package Manager, binary version"
HOMEPAGE="https://github.com/kubernetes/helm https://helm.sh"
SRC_URI="https://storage.googleapis.com/kubernetes-helm/helm-v${PV}-linux-amd64.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"

RDEPEND="!!app-admin/helm"
DEPEND="${RDEPEND}"

DOCS="README.md"

src_unpack() {
	unpack ${A}
	mv linux-amd64 "${S}"
}

src_install() {
	einstalldocs
	into /opt
	dobin helm
}
