# Tectonix

Yet another Terraform wrapper with Nix. Features a simple mechanism for
generating Terraform manifests using Nix, and creates a devShell for your
convenience.

> [!NOTE]
> Tectonix is not yet ready for use. You may be able to successfully use it if
> your use-case is small, but I encourage you to avoid implementing it in your
> workflow until we have proper checks in place. In the meantime, issues and
> pull request are welcome to improve the experience, cheers!

## Features

[JSON Syntax]: https://developer.hashicorp.com/terraform/language/syntax/json

- Small, low-cost
- Simple, readable codebase
- Works anywhere
- Supports [JSON Syntax] natively

## Usage

Work in progress. Please refer to the function definitions for the time being.

## Motivation

Terranix is bad. There, I said it. It fundamentally misunderstands Nix concepts,
and abuses them to the degree of making the codebase unusable. I initially
wanted to fork it, but the hacks they apply _just_ to create Terraform
configurations is not justifiable. Tectonix aims to approach the same concept
from a different perspective, one that does not necessitate the same hacks.

Tectonix approaches the whole "Terraform with a Nix feel" differently. We would
like to use Nix, instead of HCL, but we also don't want to bite more than we can
chew. Instead of overextending, Tectonix uses devShells to provide you the basic
tools needed to interact with Terraform. By removing the previously present
level of abstraction, you can _directly_ use Terraform, but still opt-in for
Nix-generated manifests.

## License

Licensed under [MPL v2.0](./LICENSE). See LICENSE file more details.
