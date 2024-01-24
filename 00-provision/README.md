# Provision infrastructure

```shell
sops exec-env secrets.sops.yaml "tofu init"
```

## Lock providers

```shell
tofu providers lock -platform=windows_amd64 -platform=darwin_amd64 -platform=linux_amd64
```