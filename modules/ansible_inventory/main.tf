data "template_file" "inventory" {
  template = file("${path.module}/template/inventory.tftpl")
  vars = {
    server_ip = var.server_ip
    path = path.root
  }
}

resource "local_file" "inventory" {
  filename = "${path.root}/ansible/inventory.yml"
  content  = data.template_file.inventory.rendered
}
