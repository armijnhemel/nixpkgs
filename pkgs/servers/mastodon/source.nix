# This file was generated by pkgs.mastodon.updateScript.
{ fetchgit, applyPatches }: let
  src = fetchgit {
    url = "https://github.com/mastodon/mastodon.git";
    rev = "v3.5.2";
    sha256 = "03sk0rzf7zy0vpq6f5f909hx5gbnan5b5h068grgzv2v7lj11was";
  };
in applyPatches {
  inherit src;
  patches = [];
}
