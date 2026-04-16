
# Forward

This fork has (so far) minor changes that are focused on repackaging Infer using Nix (see [`shell.nix`](./shell.nix)) so I can run it on NixOS. There is also a helper script (see [`debug_erlang.sh`](./debug_erlang.sh)) for debugging erlang programs, which runs Infer and then opens the results in firefox.

## Using [`debug_erlang.sh`](./debug_erlang.sh)

Once inside of the `nix-shell` run:
```bash
./debug_erlang.sh ./examples/hello.erl
```

---

<img src="website/static/img/logo.png"
alt="logo" width="15%" />

# Infer ![build](https://github.com/facebook/infer/actions/workflows/install.yml/badge.svg) ![website](https://github.com/facebook/infer/actions/workflows/deploy.yml/badge.svg)

[Infer](http://fbinfer.com/) is a static analysis tool for Java,
C++, Objective-C, and C. Infer is written in [OCaml](https://ocaml.org/).

## Installation

Read our [Getting
Started](http://fbinfer.com/docs/getting-started) page for
details on how to install packaged versions of Infer. To build Infer
from source, see [INSTALL.md](./INSTALL.md).

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md).

## License

Infer is MIT-licensed.

Note: Enabling Java support may require you to download and install
components licensed under the GPL.
