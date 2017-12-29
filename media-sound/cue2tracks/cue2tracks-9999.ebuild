# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="Bash script for split audio CD image files with cue sheet to tracks"
HOMEPAGE="https://github.com/ar-lex/cue2tracks"
EGIT_REPO_URI="https://github.com/ar-lex/cue2tracks.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="flake mac tta shorten wavpack mp3 m4a vorbis"

RDEPEND="
	>=media-sound/shntool-3.0.0
	app-shells/bash
	media-libs/flac
	app-cdr/cuetools
	tta? ( media-sound/ttaenc )
	shorten? ( media-sound/shorten )
	flake? ( media-sound/flake )
	vorbis? ( media-sound/vorbis-tools )
	mac? (
		media-sound/mac
		media-sound/apetag
	)
	wavpack? (
		media-sound/wavpack
		media-sound/apetag
	)
	mp3? (
		media-sound/lame
		media-sound/id3v2
	)
	m4a? (
		media-libs/faac
		media-libs/faad2
	)
"

DOCS="AUTHORS INSTALL ChangeLog README TODO"

src_install() {
	dodoc ${DOCS}
	dobin "${PN}"
}
