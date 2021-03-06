# This file was generated by go2nix.
{ stdenv, buildGoPackage, fetchFromGitHub }:

buildGoPackage rec {
  name = "machine-${version}";
  version = "0.8.1";

  goPackagePath = "github.com/docker/machine";

  src = fetchFromGitHub {
    rev = "v${version}";
    owner = "docker";
    repo = "machine";
    sha256 = "0l4a5bqfw8i8wrl5yzkqy848r7vdx6hw8p5m3z3vzabvsmsjjwy7";
  };

  postInstall = ''
    mkdir -p $bin/share/bash-completion/completions/
    cp go/src/github.com/docker/machine/contrib/completion/bash/* $bin/share/bash-completion/completions/
  '';

  postFixup =  ''
    mv $bin/bin/cmd $bin/bin/docker-machine
  '';

  meta = with stdenv.lib; {
    homepage = https://docs.docker.com/machine/;
    description = "Docker Machine is a tool that lets you install Docker Engine on virtual hosts, and manage Docker Engine on the hosts.";
    license = licenses.asl20;
    maintainers = with maintainers; [ offline tailhook ];
    platforms = platforms.unix;
  };
}
