{ lib, stdenv, fetchzip, gettext, ... }:

stdenv.mkDerivation rec {
  pname = "cockpit-podman";
  version = "124";

  src = fetchzip {
    url = "https://github.com/cockpit-project/${pname}/releases/download/${version}/${pname}-${version}.tar.xz";
    sha256 = "00fynvy69s3h8x3pb3lr7kz502ans7mbxs8nrr25pdb5hakfnnkb";
  };

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/share/cockpit
    cp -r dist $out/share/cockpit/podman
  '';

  meta = with lib; {
    description = "Cockpit UI for podman containers";
    license = licenses.lgpl21;
    homepage = "https://github.com/cockpit-project/cockpit-podman";
    platforms = platforms.linux;
    maintainers = with maintainers; [ ];
  };
}
