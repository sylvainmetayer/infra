#!/usr/bin/env bash

backend_secret_file=infrastructure/terraform/backend_secrets.yaml
access_key=$(sops -d $backend_secret_file | grep access_key | cut -d ":" -f 2 | xargs)
secret_key=$(sops -d $backend_secret_file | grep secret_key | cut -d ":" -f 2 | xargs)

cat <<EOF > infrastructure/terraform/.envrc
export AWS_ACCESS_KEY_ID=$access_key
export AWS_SECRET_ACCESS_KEY=$secret_key
EOF
