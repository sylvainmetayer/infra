#!/usr/bin/env bash

# https://snarky.ca/why-you-should-use-python-m-pip/
if [ -n "$VIRTUAL_ENV" ]; then
    python3 -m pip install -r "requirements.txt"
else
    python3 -m pip install --user -r "requirements.txt"
fi
ansible-galaxy role install -r "ansible/requirements.yml"
ansible-galaxy collection install -r "ansible/requirements.yml"
