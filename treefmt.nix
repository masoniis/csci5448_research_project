{ ... }:
{
  projectRootFile = "flake.nix";
  programs = {
    nixfmt.enable = true;
    prettier.enable = true;
    rustfmt.enable = true;
  };

  settings.formatter.dart = {
    command = "dart";
    options = [ "format" ];
    includes = [ "**/*.dart" ];
  };

  settings.global.excludes = [
    ".github/workflows/*"
  ];
}
