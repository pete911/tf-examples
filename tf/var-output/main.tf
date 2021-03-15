locals {
  vpc_cidr = "10.0.0.0/24"
  private_subnets = [
    cidrsubnet(local.vpc_cidr, 2, 0),
    cidrsubnet(local.vpc_cidr, 2, 1),
    cidrsubnet(local.vpc_cidr, 2, 2)
  ]
  protected_subnets = [
    cidrsubnet(local.vpc_cidr, 5, 24),
    cidrsubnet(local.vpc_cidr, 5, 25),
    cidrsubnet(local.vpc_cidr, 5, 26)
  ]
  firewall_subnets = [
    cidrsubnet(local.vpc_cidr, 5, 27),
    cidrsubnet(local.vpc_cidr, 5, 28),
    cidrsubnet(local.vpc_cidr, 5, 29)
  ]
}

output "subnets" {
  value = format(
    "private: %s\nprotected: %s\nfirewall: %s",
    join(" ", local.private_subnets), join(" ", local.protected_subnets), join(" ", local.firewall_subnets)
  )
}