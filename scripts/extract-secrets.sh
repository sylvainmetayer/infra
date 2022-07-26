#!/usr/bin/env bash

usage() {
    echo "Usage : $0 database.kdbx"
    echo "Require: keepassxc-cli"
}

if [[ "$#" -ne 1 ]]; then
    usage
    exit 1
fi

keepassxc-cli attachment-export "$1" '/infra/terraform_envrc' .envrc .envrc
keepassxc-cli show -a password -s "$1" /infra/ansible/vault-string-password > vault.secret
chmod 600 vault.secret