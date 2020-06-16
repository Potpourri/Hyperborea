# This derivation can work either lorri or nix-shell
# → https://github.com/target/lorri

let
  inherit (import ./helper.nix) getPinnedNixpkgs;
  inherit (import ./const.nix) myNixpkgsUrl myNixpkgsRef myOverlayUrl myOverlayRef;
  # Look here for information about pinning Nixpkgs
  # → https://nixos.wiki/wiki/FAQ/Pinning_Nixpkgs
  pinnedPkgs = getPinnedNixpkgs {
    nixpkgsRef = myNixpkgsRef;
    overlayRef = myOverlayRef;
  };
in

# This allows overriding pkgs by passing `--arg pkgs ...`
{ pkgs ? pinnedPkgs }:

with pkgs;

stdenv.mkDerivation rec {
  name = "Hyperborea-shell";
  phases = [ "nobuildPhase" ];

  buildInputs = [
    # develop dependencies:
    docopt-sh
    bashPackages.fidian_ansi
    bashPackages.mrowa44_emojify
    bashPackages.mclarkson_jsonpath
    bats
    kcov
    shellcheck
    shfmt
    jscpd
    cspell
    # runtime dependencies:
    nix-prefetch-git # for update-pinned-nixpkgs
    git # for git-scripts
    # optional dependencies:
    # -
    # other developing tools:
    cacert #WORKAROUND: https://github.com/target/lorri/issues/98
    conform
    sudo # for tests
    fakeroot # for tests
  ];

  PROJECT_ROOT = toString ../../..;
  MY_NIXPKGS_URL = myNixpkgsUrl;
  MY_NIXPKGS_REF = myNixpkgsRef;
  MY_OVERLAY_URL = myOverlayUrl;
  MY_OVERLAY_REF = myOverlayRef;
  BASH_LIB_PATH = lib.concatMapStringsSep ":" (x: PROJECT_ROOT + "/" + x) [
    "shlib/src/__globalvar__"
    "shlib/src/array"
    "shlib/src/assert"
    "shlib/src/bool"
    "shlib/src/console"
    "shlib/src/io"
    "shlib/src/panic"
    "shlib/src/path"
    "shlib/src/str"
    "shlib/src/sys"
    "shlib/src/time"
    "shlib/src/util"

    "git-scripts/src/lib"
    "media-scripts/src/lib"
    "dotfiles-scripts/src/lib"
  ];

  shellHook = ''
    PATH+=":$BASH_LIB_PATH"
    PATH+=":$PROJECT_ROOT/bash-bundler/bin"
    PATH+=":$PROJECT_ROOT/bashfnx/bin"
    PATH+=":$PROJECT_ROOT/makeall/bin"
    PATH+=":$PROJECT_ROOT/tools"
    PATH+=":$PROJECT_ROOT/update-pinned-nixpkgs/bin"
    PATH+=":$PROJECT_ROOT/nix-shell2docker/bin"

    export SHELLCHECK_OPTS="--source-path=$BASH_LIB_PATH"
  '';

  nobuildPhase = ''
    echo
    echo "This derivation is not meant to be built, aborting"
    echo
    exit 1
  '';
}
