output "my_vpc_id" {
  value = module.my_vpc_default.vpc_id
}

output "my_vpc_cidr" {
  value = module.my_vpc_default.vpc_cidr
}

output "my_public_subnet_ids" {
  value = module.my_vpc_default.public_subnet_ids
}

output "my_private_subnet_ids" {
  value = module.my_vpc_default.private_subnet_ids
}

output "my_vpc_id_staging" {
  value = module.my_vpc_staging.vpc_id
}

output "my_vpc_cidr_staging" {
  value = module.my_vpc_staging.vpc_cidr
}

output "my_public_subnet_ids_staging" {
  value = module.my_vpc_staging.public_subnet_ids
}

output "my_private_subnet_ids_staging" {
  value = module.my_vpc_staging.private_subnet_ids
}

output "my_vpc_id_prod" {
  value = module.my_vpc_prod.vpc_id
}

output "my_vpc_cidr_prod" {
  value = module.my_vpc_prod.vpc_cidr
}

output "my_public_subnet_ids_prod" {
  value = module.my_vpc_prod.public_subnet_ids
}

output "my_private_subnet_ids_prod" {
  value = module.my_vpc_prod.private_subnet_ids
}
