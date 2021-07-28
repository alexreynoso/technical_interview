# https://www.terraform.io/docs/providers/aws/index.html
provider "aws" {  # Tokyo
  alias  = "asia"
  region = "ap-northeast-1"  # non-locked region by CSIS
}

# https://www.terraform.io/docs/providers/aws/index.html
provider "aws" {  # Ireland
  alias  = "europe"
  region = "eu-west-1"  # non-locked region by CSIS
}

# https://www.terraform.io/docs/providers/aws/index.html
provider "aws" {  # Northern Virginia
  alias  = "america"
  region = "us-east-1"  # default region non-locked by CSIS
}
