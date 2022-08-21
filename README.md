# infra

## Setup

```shell
./scripts/extract-secrets YOUR_KEEPASSXC_DATABASE
terraform init
terraform login
terraform apply
ansible-playbook ansible/playbooks/setup.yaml
ansible-playbook ansible/playbooks/test.yaml -K
```