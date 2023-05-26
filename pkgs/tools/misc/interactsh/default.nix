{ lib
, buildGoModule
, fetchFromGitHub
}:

buildGoModule rec {
  pname = "interactsh";
  version = "1.1.4";

  src = fetchFromGitHub {
    owner = "projectdiscovery";
    repo = pname;
    rev = "refs/tags/v${version}";
    hash = "sha256-yqvIbL5qiVSxI+G1RaZWzM8m8wlBnsTKavreIPkzvMU=";
  };

  vendorHash = "sha256-NYaRuVf9cOME9znIEmYxWNcUce8Kiuym/4ycjDtsuaQ=";

  modRoot = ".";
  subPackages = [
    "cmd/interactsh-client"
    "cmd/interactsh-server"
  ];

  # Test files are not part of the release tarball
  doCheck = false;

  meta = with lib; {
    description = "An Out of bounds interaction gathering server and client library";
    longDescription = ''
      Interactsh is an Open-Source Solution for Out of band Data Extraction,
      A tool designed to detect bugs that cause external interactions,
      For example - Blind SQLi, Blind CMDi, SSRF, etc.
    '';
    homepage = "https://github.com/projectdiscovery/interactsh";
    changelog = "https://github.com/projectdiscovery/interactsh/releases/tag/v${version}";
    license = licenses.mit;
    maintainers = with maintainers; [ hanemile ];
  };
}
