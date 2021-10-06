packer {
  required_plugins {
    vsphere = {
      version = ">=0.0.1"
      source  = "github.com/hashicorp/vsphere"
    }
  }
}