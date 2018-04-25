with import <nixpkgs> {};

let
  ghc = haskellPackages.ghcWithPackages (ps: with ps; [ zip-archive regex-tdfa reflection aeson http-conduit attoparsec ]);
in runCommand "log-classifier" { buildInputs = [ ghc haskellPackages.ghcid ]; } ''
  cp -r ${builtins.fetchGit ./.} src
  chmod -R +w src
  cd src
  mkdir -p $out/bin/
  ghc Zendesk.hs -o $out/bin/log-classifier -Wall
''
