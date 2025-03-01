terraform {
  backend "s3" {
    bucket         = "hcltfcode"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    
  }
}
