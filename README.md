# infra

## Setup

```shell
./scripts/extract-secrets YOUR_KEEPASSXC_DATABASE
terraform init
terraform login
terraform apply
ansible-playbook ansible/playbooks/setup.yaml -e @ansible/secrets.vault.yml
ansible-playbook ansible/playbooks/test.yaml -K -e @ansible/secrets.vault.yml
```