{ ... }:
{
  projectRootFile = "flake.nix";
  programs = {
    nixfmt.enable = true;
    prettier.enable = true;
    rustfmt.enable = true;
  };

  settings.formatter.dartfmt = {
    command = "dart format";
    includes = [
      "*.dart"
    ];
  };

  settings.global.excludes = [
    ".github/workflows/*"
  ];
}
