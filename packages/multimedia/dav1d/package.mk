# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dav1d"
PKG_VERSION="0.4.0"
PKG_SHA256="18bf96c5168b8c704422387620fefaa953e8dbd4eacb0f0796c03d6e741f8924"
PKG_LICENSE="BSD"
PKG_SITE="http://www.jbkempf.com/blog/post/2018/Introducing-dav1d"
PKG_URL="https://code.videolan.org/videolan/dav1d/-/archive/${PKG_VERSION}/dav1d-${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="dav1d is an AV1 decoder :)"

configure_package() {
  if [ "${TARGET_ARCH}" = "x86_64" ]; then
    PKG_DEPENDS_TARGET+=" nasm:host"
  fi
}

pre_configure_target(){
  PKG_MESON_OPTS_TARGET="-Denable_tools=false \
                         -Denable_tests=false"
}