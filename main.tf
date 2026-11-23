module "dev-infra" {
  source      = "./infra-app"
  env         = "dev"
  bucket_name = "backup"
}


module "uat-infra" {
  source      = "./infra-app"
  env         = "uat"
  bucket_name = "backup"
}



module "prod-infra" {
  source      = "./infra-app"
  env         = "prod"
  bucket_name = "backup"
}