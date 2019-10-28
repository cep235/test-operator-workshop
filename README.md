# Test Operator Workshop

Just a test repository for learning how to create an operator. Not intended to be used for production.

## Installing Prerequisites (Including Operator SDK)

To install prerequisites, run:

```
# sh install_prerequisites_rhel.sh
```

## Creating Demo Memcached Operator

You may want to set `GOPROXY` before running anything:

```
$ GOPROXY=https://proxy.golang.org
```

Also make sure you have `KUBECONFIG` pointing to your `kubeconfig` file. (e.g., `export KUBECONFIG=/path/to/kubeconfig`)

Now follow the instructions on: https://github.com/operator-framework/operator-sdk/blob/master/doc/user-guide.md
