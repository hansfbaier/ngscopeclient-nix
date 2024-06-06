# How to use
```
$ nix shell github:hansfbaier/ngscopeclient-nix
$ ngscopeclient
```

# Usage as a flake

[![FlakeHub](https://img.shields.io/endpoint?url=https://flakehub.com/f/hansfbaier/ngscopeclient-nix/badge)](https://flakehub.com/flake/hansfbaier/ngscopeclient-nix)

Add ngscopeclient-nix to your `flake.nix`:

```nix
{
  inputs.ngscopeclient-nix.url = "https://flakehub.com/f/hansfbaier/ngscopeclient-nix/*.tar.gz";

  outputs = { self, ngscopeclient-nix }: {
    # Use in your outputs
  };
}

```
