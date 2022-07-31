#!/usr/bin/env bash

usage() {
    echo "Usage : $0 database.kdbx"
    echo "Require: keepassxc-cli"
}

if [[ "$#" -ne 1 ]]; then
    usage
    exit 1
fi

keepassxc-cli attachment-import "$1" '/infra/terraform_envrc' .envrc .envrc -f
