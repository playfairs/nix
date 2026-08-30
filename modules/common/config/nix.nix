{
  ...
}:
{
  nix.settings = {
    cores = 6;
    max-jobs = "auto";

    experimental-features = [
      "nix-command"
      "flakes"
    ];

    extra-experimental-features = [
      "pipe-operators"
    ];

    substituters = [
      "https://nix-community.cachix.org"
      "https://oxalica.cachix.org"
    ];

    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "oxalica.cachix.org-1:9CvSGS1W+FeSc3Xiy8kCcKyyptYv4UnvOAzh7VvC5Vg="
    ];
  };
}
