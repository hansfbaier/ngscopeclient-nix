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
    owner = "hansfbaier";
    repo = "scopehal-apps";
    rev = "8729420521eb35df36eed2cdba99e2a771fc0809";
    hash = "sha256-2cn9hXv+Gn6uW5z5R3dX0ZTWOv0VHh/25hHY0I9tsqc=";
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
    license = licenses.bsd3;
    platforms = platforms.all;
  };
}
