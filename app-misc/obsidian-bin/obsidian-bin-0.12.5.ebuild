# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Powerful knowledge base working on top of a local folder of Markdown files"
HOMEPAGE="https://obsidian.md"
SRC_URI="https://github.com/obsidianmd/obsidian-releases/releases/download/v${PV}/Obsidian-${PV}.AppImage -> ${P}"

LICENSE="obsidian-EULA"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

RDEPEND=""
DEPEND="${RDEPEND}"

src_unpack() {
	mkdir "${S}"
	cd "${S}"
	cp --dereference "${DISTDIR}/${A}" obsidian
}

src_install() {
	into /opt
	dobin obsidian
}
