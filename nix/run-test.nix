{ emacsWithPackages }:
let
  pkgs = import <nixpkgs> {};
  versioned_emacs = emacsWithPackages (epkgs: with epkgs; [
    company
    counsel
    dash
    ht
    s
    ert-runner
  el-mock
  ]);
in derivation rec {
  name = "company-tailwindcss";
  baseInputs = [];
  builder = "${pkgs.bash}/bin/bash";
  args = [ ./builder.sh ];
  setup = ./setup.sh;
  buildInputs = with pkgs; [
    gnugrep
    versioned_emacs coreutils];
  emacs = versioned_emacs;
  company_tailwindcss = ../company-tailwindcss.el;
  test_target = ../test;
  system = builtins.currentSystem;
}

  
