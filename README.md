# Vault Catzzz Secrets Plugin

This is an example secrets engine plugin for [HashiCorp Vault](https://www.vaultproject.io/). It is meant for demonstration purposes only and should never be used in production.

## Usage

All commands can be run using the provided [Makefile](./Makefile). However, it may be instructive to look at the commands to gain a greater understanding of how Vault registers plugins. Using the Makefile will result in running the Vault server in `dev` mode. Do not run Vault in `dev` mode in production. The `dev` server allows you to configure the plugin directory as a flag, and automatically registers plugin binaries in that directory. In production, plugin binaries must be manually registered.

This will build the plugin binary and start the Vault dev server:

```
# Build the plugin and start Vault dev server with plugin automatically registered
$ make
```

Now open a new terminal window and run the following commands:

```
# Open a new terminal window and export Vault dev server http address
$ export VAULT_ADDR='http://127.0.0.1:8200'

# Enable the Mock plugin
$ make enable

# Write a secret to the Mock secrets engine
$ vault write catzzz-secrets/kitten key=DoesThisMatter
Success! Data written to: catzzz/test

# Retrieve secret from Mock secrets engine
$ vault read catzzz-secrets/kitten
Key    Value
---    -----
cat    /\_/\
( o o )
==_Y_==
  '-'
 ```
