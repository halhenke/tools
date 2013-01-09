-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Format: 1.0
Source: xorg-server
Binary: xserver-xorg-core, xserver-xorg-core-udeb, xserver-xorg-dev, xdmx, xdmx-tools, xnest, xvfb, xserver-xephyr, xserver-xfbdev, xserver-xorg-core-dbg, xserver-common
Architecture: any all
Version: 2:1.11.4-0ubuntu10.8
Maintainer: Ubuntu X-SWAT <ubuntu-x@lists.ubuntu.com>
Uploaders: Drew Parsons <dparsons@debian.org>, Cyril Brulebois <kibi@debian.org>
Standards-Version: 3.9.3
Vcs-Browser: http://git.debian.org/?p=pkg-xorg/xserver/xorg-server.git
Vcs-Git: git://git.debian.org/git/pkg-xorg/xserver/xorg-server
Build-Depends: debhelper (>= 7), quilt, lsb-release, pkg-config, bison, flex, automake, libtool, xauth, xutils-dev (>= 1:7.6+4), xfonts-utils (>= 1:7.5+1), x11proto-bigreqs-dev (>= 1:1.1.0), x11proto-composite-dev (>= 1:0.4), x11proto-core-dev (>= 7.0.22), x11proto-damage-dev (>= 1.1), x11proto-fixes-dev (>= 1:5.0-2ubuntu1), x11proto-kb-dev (>= 1.0.3), x11proto-xinerama-dev, x11proto-randr-dev (>= 1.2.99.3), x11proto-record-dev (>= 1.13.99.1), x11proto-render-dev (>= 2:0.11), x11proto-resource-dev, x11proto-scrnsaver-dev, x11proto-video-dev, x11proto-xcmisc-dev (>= 1.2.0), x11proto-xext-dev (>= 7.1.99), x11proto-xf86bigfont-dev (>= 1.2.0), x11proto-xf86dga-dev (>= 2.0.99.1), x11proto-xf86vidmode-dev (>= 2.2.99.1), xtrans-dev (>= 1.2.2), libxau-dev (>= 1:1.0.5-2), x11proto-input-dev (>= 2.1.99.6), x11proto-dri2-dev (>= 2.6), libxdmcp-dev (>= 1:0.99.1), libxfont-dev (>= 1:1.4.2), libxkbfile-dev (>= 1:0.99.1), libpixman-1-dev (>= 0.21.8), libpciaccess-dev (>= 0.11.0-2), libgcrypt-dev, nettle-dev, libdbus-1-dev [kfreebsd-any], libhal-dev [kfreebsd-any], libudev-dev (>= 151-3), libselinux1-dev (>= 2.0.80), x11proto-xf86dri-dev (>= 2.1.0), libdrm-dev (>= 2.4.3) [!hurd-i386], x11proto-gl-dev (>= 1.4.14), mesa-common-dev (>= 7.10.3-0ubuntu1), libgl1-mesa-dev (>= 7.8), libxmuu-dev (>= 1:0.99.1), libxext-dev (>= 1:0.99.1), libx11-dev (>= 1:0.99.2), libxrender-dev (>= 1:0.9.0), libxi-dev (>= 2:1.2.99.1), x11proto-dmx-dev (>= 1:2.2.99.1), libdmx-dev (>= 1:1.0.1), libxpm-dev (>= 1:3.5.3), libxaw7-dev (>= 1:0.99.1), libxt-dev (>= 1:0.99.1), libxmu-dev (>= 1:0.99.1), libxtst-dev (>= 1:0.99.1), libxres-dev (>= 1:0.99.1), libxfixes-dev (>= 1:3.0.0), libxv-dev, libxinerama-dev, xkb-data, x11-xkb-utils
Package-List: 
 xdmx deb x11 optional
 xdmx-tools deb x11 optional
 xnest deb x11 optional
 xserver-common deb x11 optional
 xserver-xephyr deb x11 optional
 xserver-xfbdev deb x11 optional
 xserver-xorg-core deb x11 optional
 xserver-xorg-core-dbg deb debug extra
 xserver-xorg-core-udeb udeb debian-installer optional
 xserver-xorg-dev deb x11 optional
 xvfb deb x11 optional
Checksums-Sha1: 
 ef0c56c2367b6b995e85a3dddea228e6e8e246c5 6567456 xorg-server_1.11.4.orig.tar.gz
 0e961e35d8a687857961f779ebe0a317d7bbfbaa 634137 xorg-server_1.11.4-0ubuntu10.8.diff.gz
Checksums-Sha256: 
 9c2b1ebe6ca643d38b6732819285be17a6104139ff96bdfcb062ca07913a2fa5 6567456 xorg-server_1.11.4.orig.tar.gz
 0031734e5da21d9996a86b808a6b0090b488cc8d351b101926fa6634e93d3549 634137 xorg-server_1.11.4-0ubuntu10.8.diff.gz
Files: 
 38a6001cc4d135647961fe1efb97e1d1 6567456 xorg-server_1.11.4.orig.tar.gz
 d5a8a59e97f40869a7d7857bd8be687d 634137 xorg-server_1.11.4-0ubuntu10.8.diff.gz
Original-Maintainer: Debian X Strike Force <debian-x@lists.debian.org>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlAgFLwACgkQEaMBVuDmdhGFqgCggSrD6MU1lpf8xc2yVYPtutcu
zAoAnj/frmvNqrKI2dWAWAE/4NldSAGK
=8Kd0
-----END PGP SIGNATURE-----
