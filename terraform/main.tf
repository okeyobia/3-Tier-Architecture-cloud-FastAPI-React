module "networking" {
  source   = "./modules/networking"
  app_name = var.app_name
}

module "database" {
  source          = "./modules/database"
  app_name        = var.app_name
  db_name         = var.db_name
  db_user         = var.db_user
  db_password     = var.db_password
  private_subnets = module.networking.private_subnets
  vpc_id          = module.networking.vpc_id
}

module "backend" {
  source          = "./modules/backend"
  app_name        = var.app_name
  vpc_id          = module.networking.vpc_id
  private_subnets = module.networking.private_subnets
  public_subnets  = module.networking.public_subnets
  backend_image   = var.backend_image
  db_secret_arn   = module.database.secret_arn
  db_host         = module.database.db_endpoint
}

module "frontend" {
  source              = "./modules/frontend"
  app_name            = var.app_name
  acm_certificate_arn = var.acm_certificate_arn
}