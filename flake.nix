{
  description = "Manage Terraform/Opentofu using Nix DSL";

  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

  outputs = {nixpkgs, ...}: let
    pkgs = import nixpkgs {system = "x86_64-linux";};

    # Generate Terraform configuration in JSON format as a Nix store path
    generateTerraformJson = args:
      pkgs.writers.writeJSON "terraform.json" args;

    # TODO: cleaner argument parsing, or usage of flake-parts
    terraformWrapper = args:
      pkgs.mkShellNoCC {
        buildInputs = with pkgs; [terraform jq];

        # TODO: We want to use jq or something similar to «optionally» run tests
        # on the Terraform configuration. For now trust that the user know what
        # they are doing. A flake-parts module would make this much easier
        # since we actually enter a module system.
        TERRAFORM_CONFIG = generateTerraformJson args;

        shellHook = ''
          echo "Terraform configuration generated and available from the Nix store."
          export

          echo "Using Terraform configuration from: $TERRAFORM_CONFIG"
          echo "You can now run Terraform commands, such as 'terraform init' or 'terraform apply'."
        '';
      };
  in {
    lib = {inherit terraformWrapper;};
  };
}
