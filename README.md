# Infra

## Docs

Requirements :

- [pipenv](https://pipenv.pypa.io/en/latest/installation.html)

Generate schema : `update_schema.sh` in `docs` folder

## Infrastructure

Requirements :

- [age](TODO)
- [sops](TODO)
- [opentofu](TODO)

Extract backend credentials to fetch state stored in s3 with `./scripts/configure_backend_secrets.sh`

Run apply/plan/destroy operations in `infrastructure/terraform` folder
