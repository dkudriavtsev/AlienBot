with (import <nixpkgs> {});
let
  env = bundlerEnv {
    name = "archbot-bundler-env";
    inherit ruby;
    gemfile  = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset   = ./gemset.nix;
  };
in stdenv.mkDerivation {
  name = "archbot";
  buildInputs = [ env ];
}
