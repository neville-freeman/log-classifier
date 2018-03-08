with import <nixpkgs> {};

let
  ghc = haskellPackages.ghcWithPackages (ps: with ps; [ zip-archive regex-tdfa reflection ]);
in runCommand "unify" { buildInputs = [ ghc haskellPackages.ghcid ]; } ''
  cp -r ${builtins.fetchGit ./.} src
  chmod -R +w src
  cd src
  mkdir -p $out/bin/
  ghc Entry.hs
  ghc -no-hs-main Entry.hs main.c -o $out/bin/main
''
