#!/usr/bin/env bash

sudo dnf install pipx
pipx ensurepath

if [[ -z $PIPENV_ACTIVE ]]; then
    echo "Pipenv not detected, install deps"
    pipx install pipenv
    pipenv install
fi

pipenv run ansible-galaxy role install -r "requirements.yml"
pipenv run ansible-galaxy collection install -r "requirements.yml"
