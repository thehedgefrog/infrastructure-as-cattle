### Ubuntu 20.04.3 LTS - Hashicorp Stack version ###

build {
  sources = ["source.vsphere-iso.ubuntu-20043lts"]

  provisioner "ansible" {
    user          = var.ssh_username
    playbook_file = "./playbooks/ubuntu-hashistack-main.yml"
  }

  provisioner "shell" {
    execute_command = "echo '${var.ssh_password}' | {{.Vars}} sudo -S -E bash '{{.Path}}'"

    environment_vars = [
      "BUILD_USERNAME=${var.ssh_username}",
    ]

    scripts           = ["./scripts/setup_ubuntu2004.sh"]
    expect_disconnect = true
  }
}