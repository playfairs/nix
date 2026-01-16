# NixOS Overview

This README gives a high-level overview of **NixOS**, what makes it unique, and why it’s worth looking into, at least from my own perspective of someone who has used it for half a year.

---

## Why NixOS?

### Friendly Community

The NixOS community is known for being helpful and knowledgeable, especially when it comes to solving complex configuration problems.

### Powerful Package Manager

Nix uses the **Nix package manager**, which has:

* One of the largest collections of packages available (even when counting *only* stable packages).
* A system that lets you **create your own packages** or make custom software behave as if it were part of `nixpkgs`.
* A relatively straightforward contribution process if you want to get packages into the official `nixpkgs` repository.

---

## A Completely Different Way to Install Software

NixOS does *not* install packages the way traditional Linux distributions do.

Instead of installing software imperatively (e.g., `apt install` or `pacman -S`), you **declare** what you want installed inside a configuration file.

### Configuration Files

* By default, packages are defined in:

  ```
  /etc/nixos/configuration.nix
  ```
* When using **Nix Flakes**, configuration is usually split into multiple files inside a `.nix` directory.

Example (personal setup, also relative to this repo):


[`~/.nix/modules/home/packages.nix`](https://github.com/playfairs/nix/blob/main/modules/home/packages.nix)


This file defines all user-installed packages in one place, making the system easy to understand, modify, and reproduce

---

## Reproducibility

One of NixOS’s biggest strengths is **reproducibility**.

If your configuration works on one machine, it **will work on another**—no guesswork, no hidden state, and no manual fixes required.

This makes NixOS ideal for:

* Multiple machines
* Rebuilding systems after failure
* Sharing configurations
* Long-term maintenance

---

## Running Software Without Installing It

Nix allows you to run packages *temporarily* without permanently installing them: (As long as it contains a `flake.nix` file that is)

```bash
nix run nixpkgs#packagename
```

What this does:

* Downloads the package and its dependencies
* Runs it immediately
* Does not permanently modify your system

You can clear cached data afterward with a single command.

```bash
  sudo nix-collect-garbage --delete-older-than 1d # You can obviously change the older-than time
```

This is perfect for:

* Testing software
* Demos or presentations
* Quickly trying tools without committing anything to them

---

## Nix Flakes 1.A

**Nix Flakes** introduce a more structured and modern way to manage Nix configurations.

They form an entire ecosystem that improves:

* Dependency pinning
* Reproducibility
* Sharing and collaboration

Flakes are extremely powerful, but they’re best learned visually or step-by-step. Watching a tutorial is highly recommended.

---

## Nix Flakes 1.B (Development Shells)

**Nix Flake Files** (`flake.nix`) allow you to define development shells using flake.nix.

**Dev shells** provide a reproducible development environment with all required tools available instantly—without permanently installing anything on your system.

What is a Dev Shell?

A dev shell is an isolated environment that:

* Includes only the tools you define (compilers, linters, language servers, etc.)
* Is fully reproducible across machines
* Does not pollute your global system environment

Think of a Dev Shell as a better version of a Python Virtual Environment, where you specify packages (and can version lock them too), your shellHook, buildInputs, install phase and more.

---

## Learning Resources

Here are two excellent videos to get started:

* [https://youtu.be/MiElqKB1lz8](https://youtu.be/MiElqKB1lz8)
* [https://youtu.be/CwfKlX3rA6E](https://youtu.be/CwfKlX3rA6E)

Both explain NixOS and Flakes in a clear and approachable way.
