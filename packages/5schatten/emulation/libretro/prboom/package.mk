# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="prboom"
PKG_VERSION="d469c089ea7f7b5b431888a4e5a3fc0bae5bc126"
PKG_SHA256="1ae1a1f9b10b4160f078f055c2f0e24ab8264eea9f81a40c1c33a84e5620883a"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/libretro-prboom"
PKG_URL="https://github.com/libretro/libretro-prboom/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Port of prboom to libretro - plays Doom, Doom II, Final Doom and other Doom IWAD mods."
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="+lto"

PKG_LIBNAME="prboom_libretro.so"
PKG_LIBPATH="${PKG_LIBNAME}"

PKG_MAKE_OPTS_TARGET="GIT_VERSION=${PKG_VERSION:0:7}"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/bin
  mkdir -p ${INSTALL}/usr/lib/libretro
  mkdir -p ${INSTALL}/usr/share/prboom

  cp ${PKG_DIR}/scripts/* ${INSTALL}/usr/bin
  cp ${PKG_BUILD}/prboom.wad ${INSTALL}/usr/share/prboom
  cp -v ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/
}
