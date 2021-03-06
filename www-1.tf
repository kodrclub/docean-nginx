resource "digitalocean_droplet" "www-1" {
    image = "ubuntu-18-04-x64"
    name = "www-1"
    region = "ams3"
    size = "s-1vcpu-1gb"
    private_networking = true
    ssh_keys = [
      var.ssh_fingerprint
    ]

    connection {
      host = self.ipv4_address
      user = "root"
      type = "ssh"
      private_key = file(var.pvt_key)
      timeout = "2m"
    }

    provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      # install nginx
      "sudo apt-get update",
      "sudo apt-get -y install nginx",
      "sudo echo '<h1>Hello from server ONE</h1>' > /var/www/html/index.html"
    ]
  }
}