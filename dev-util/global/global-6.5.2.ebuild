# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit eutils

DESCRIPTION="Tag system to find the locations of a specified object in various sources"
HOMEPAGE="http://www.gnu.org/software/global/global.html"
SRC_URI="http://tamacom.com/global/${P}.tar.gz"
RESTRICT="mirror"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc +sqlite3"

RDEPEND="
	|| ( dev-libs/libltdl:0 sys-devel/libtool:2 )
	sys-libs/ncurses:5
	dev-util/ctags
	dev-python/pygments
	sqlite3? ( dev-db/sqlite:3 )
"

DEPEND="
	${RDEPEND}
	doc? ( app-text/texi2html sys-apps/texinfo )
"

DOCS="AUTHORS FAQ NEWS README THANKS"

src_configure() {
	econf \
			--with-exuberant-ctags=/usr/bin/exuberant-ctags \
			$(use_with sqlite3)
}

src_compile() {
	if use doc; then
		texi2pdf -q -o doc/global.pdf doc/global.texi
		texi2html -o doc/global.html doc/global.texi
	fi

	emake
}

src_install() {
	emake DESTDIR="${D}" install

	if use doc; then
		dohtml doc/global.html
		# doc/global.pdf is generated if tex executable (e.g. /usr/bin/tex) is available.
		[[ -f doc/global.pdf ]] && dodoc doc/global.pdf
	fi

	dodoc ${DOCS}

	insinto /etc

	doins gtags.conf
	newenvd "${FILESDIR}/${PN}-configuration.env" "87${PN}"
	prune_libtool_files
}
