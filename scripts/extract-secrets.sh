#!/usr/bin/env bash

usage() {
    echo "Usage : $0 database.kdbx"
    echo "Require: keepassxc-cli"
}

if [[ "$#" -ne 1 ]]; then
    usage
    exit 1
fi

/usr/bin/flatpak run --branch=stable --arch=x86_64 --command=keepassxc-cli org.keepassxc.KeePassXC attachment-export "$1" '/infra/terraform_envrc' .envrc .envrc
/usr/bin/flatpak run --branch=stable --arch=x86_64 --command=keepassxc-cli org.keepassxc.KeePassXC show -a password -s "$1" /infra/ansible/vault-string-password > vault.secret
chmod 600 vault.secret