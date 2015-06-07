# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3

DESCRIPTION="Watches files and records, or triggers actions, when they change"
HOMEPAGE="http://facebook.github.io/watchman"
EGIT_REPO_URI="https://github.com/facebook/watchman.git"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="python"

RDEPEND="python? ( dev-lang/python:* )"
DEPEND="${RDEPEND}"

DOCS="README.markdown"

src_configure() {
	./autogen.sh
	econf --enable-lenient $(use_with python)
}
