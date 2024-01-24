#!/usr/bin/env pipenv run

from diagrams import Cluster, Diagram, Edge
from diagrams.alibabacloud.storage import FileStorageNas
from diagrams.aws.compute import EC2
from diagrams.aws.database import RDS
from diagrams.aws.network import ELB
from diagrams.aws.storage import S3
from diagrams.custom import Custom
from diagrams.generic.blank import Blank
from diagrams.generic.device import Mobile
from diagrams.generic.network import Firewall, Subnet
from diagrams.generic.os import LinuxGeneral, Raspbian
from diagrams.generic.storage import Storage
from diagrams.oci.compute import VM
from diagrams.oci.connectivity import DNS, VPN
from diagrams.oci.monitoring import Email
from diagrams.onprem.certificates import LetsEncrypt
from diagrams.onprem.client import Client, User, Users
from diagrams.onprem.compute import Server
from diagrams.onprem.container import Docker
from diagrams.onprem.iac import Ansible, Terraform
from diagrams.onprem.network import Nginx
from diagrams.saas.chat import Telegram
from diagrams.saas.filesharing import Nextcloud

main_email_domain = 'redacted'

with Diagram("Services", filename="services", show=False, outformat=["pdf", "png"], direction='TB', strict=True):
    with Cluster('Home'):
        windows = Client('Windows')
        fedora = Client('Fedora')
        with Cluster('Internal Access'):
            pi3 = LinuxGeneral('pi 3b+')
            # pi4 = LinuxGeneral('pi 4')
            # pine64 = LinuxGeneral('Pine64')
            # nas = FileStorageNas('DS216j')
            nas = Custom("DS216j", "./img/Synology.png")
            restricted_access = [pi3, nas]
        with Cluster('External Access'):
            vpn = VPN('vpn')

    with Cluster('Cloudflare'):
        agent_ready = Server('agent-ready.pages.dev SSG')

    with Cluster('Gandi DNS'):
        sylvain_dev_dns = DNS('sylvain.dev')
        metayer_dev_dns = DNS('metayer.dev')

        app_dns = DNS('sylvain.cloud')
        DNS(main_email_domain)

    with Cluster('Scaleway'):
        terraform_bucket = S3('Terraform')
        backup_bucket = S3('Backup bucket')

    with Cluster('Infomaniak'):
        kdrive = Custom("", "./img/kdrive.png")
        # kdrive = Nextcloud('kDrive')
        with Cluster('Email'):
            main_email = Email(main_email_domain)
            aliases_emails = [
                Email('sylvain.dev'),
                Email('metayer.dev'),
            ]
            emails = aliases_emails + [main_email]

    with Cluster('Netlify'):
        eleventy_website = Server('sylvain.dev SSG')

    hetzner = Cluster('Hetzner')
    with hetzner:
        firewall = Firewall('Hetzner firewall')
        backup_storage_box = Storage('StorageBox Backup')
        donald = Server('donald')
        with Cluster('donald VPS'):
            nginx = Nginx('NGINX')
            containers = [
                Nextcloud('Nextcloud'),
                Docker('Monica CRM'),
                Docker('FreshRSS'),
                Docker('Betisier-TP')
            ]

    deadman_switch = Telegram("deadmansswitch.net Bot")
    healthcheck_signal = Telegram("healthchecks.io Signal bot")

    simple_login = Custom("", "./img/SimpleLogin.png")

    lets_encrypt = LetsEncrypt('Certificates')

    with Cluster('Provisionning tooling'):
        terraform = Terraform('Terraform')
        ansible = Ansible('Ansible')

    iac = [terraform, ansible]


    # me = User('Sylvain')
    phone = Mobile('Pixel')
    emergency_contacts = Users('Emergency contacts')
    devices = [phone, windows, fedora]


    #########


    # me >> devices
    devices - Edge(label='Sync') - kdrive
    phone >> vpn

    # devices >> deadman_switch
    deadman_switch >> Edge(label='Notify if no response') >> emergency_contacts

    backup = [backup_bucket, backup_storage_box]

    terraform >> terraform_bucket
    #terraform >> backup
    #terraform >> [firewall, donald]
    #ansible >> Edge(label='Configure') >> donald
    #terraform >> [app_dns, sylvain_dev_dns]

    [app_dns, sylvain_dev_dns] >> firewall
    aliases_emails >> simple_login >> Edge(label='Forward') >> main_email
    firewall >> donald >> nginx
    nginx >> containers
    donald >> backup >> healthcheck_signal >> Edge(label='Notify if failure') >> phone
    donald - lets_encrypt - [app_dns, sylvain_dev_dns]
    sylvain_dev_dns >> eleventy_website
    vpn - restricted_access
