  output "lb-addr" {
    value = digitalocean_loadbalancer.www-lb.ip
  }

  output "w1-addr" {
    value = digitalocean_droplet.www-1.ipv4_address
  }

  output "w2-addr" {
    value = digitalocean_droplet.www-2.ipv4_address
  }