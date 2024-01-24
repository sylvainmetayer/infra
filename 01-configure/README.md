#!/usr/bin/env bash

```shell
./setup.sh
pipenv shell
ansible-playbook 00-setup.yaml
sops exec-env secrets.sops.yaml 'ansible-playbook 01-nextcloud.yaml --extra-vars "ansible_become_pass=$password"'

```

