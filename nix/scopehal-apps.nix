{ stdenv, cmake, git, lib, fetchFromGitHub, pkg-config,
  libsigcxx, gtkmm3, cairomm, yaml-cpp, catch2, glfw, libtirpc, liblxi,
  glew, 
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
    description = "Advanced test and measurement instrument remote control and analysis suite";
    homepage = "https://www.ngscopeclient.org/";
    license = licenses.bsd2;
    platforms = platforms.all;
  };
}