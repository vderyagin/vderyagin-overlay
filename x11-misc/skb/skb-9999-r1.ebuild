# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Simple keyboard indicator"
HOMEPAGE="https://github.com/polachok/skb"
EGIT_REPO_URI="https://github.com/polachok/skb.git"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

RDEPEND="x11-libs/libX11"
DEPEND="${RDEPEND}"

DOCS="README"
