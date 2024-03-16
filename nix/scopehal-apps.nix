{ stdenv, cmake, git, lib, fetchFromGitHub, pkg-config,
  libsigcxx, gtkmm3, cairomm, yaml-cpp, catch2, glfw, libtirpc, liblxi,
  glew, libllvm, libdrm, elfutils, libxcb, zstd, libxshmfence, xcbutilkeysyms,
  systemd,
  shaderc, vulkan-headers, vulkan-loader, vulkan-tools, glslang, spirv-tools,
  ffts,
  ... }:
stdenv.mkDerivation rec {
  pname = "scopehal-apps";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "ngscopeclient";
    repo = "scopehal-apps";
    rev = "cefd7df5e639f26f07576b78165acb0608eb5e2d";
    hash = "sha256-r07Ko9YTR5sd4Yuz8daoQU2BS3pUCkmGDVS5KzTU/bA=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [ cmake git ];
  buildInputs = [
    pkg-config
    libsigcxx
    gtkmm3
    cairomm
    yaml-cpp
    catch2
    glfw
    libtirpc
    liblxi
    glew
    libllvm
    libdrm
    elfutils
    libxcb
    zstd
    libxshmfence
    xcbutilkeysyms
    systemd
    vulkan-headers
    vulkan-loader
    vulkan-tools
    spirv-tools
    glslang
    shaderc
    ffts
 ];

  cmakeFlags = [
    "-DCURRENT_GIT_VERSION=${lib.substring 0 7 src.rev}"
    "-Wno-deprecated"
  ];

  meta = with lib; {
    homepage = "https://www.ngscopeclient.org/";
    license = licenses.bsd3;
    platforms = platforms.all;
  };
}
