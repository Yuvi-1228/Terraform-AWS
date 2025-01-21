terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.84.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.6.3"
    }
  }
}

provider "random" {
  # Configuration options
}

provider "aws" {
  # Configuration options
  region = "us-east-1" #manually single region
  #region = var.region #if you are using multiple task
}

resource "random_id" "tf_random" {
    byte_length = 8
  }

resource "aws_s3_bucket" "website" {
    bucket = "website.${random_id.tf_random.hex}" 
}

resource "aws_s3_bucket_public_access_block" "example" {
    bucket = aws_s3_bucket.website.id

  block_public_acls   = false
  block_public_policy = faslse

}

resource "aws_s3_bucket_policy" "website" {
    bucket = aws_s3_bucket.website.id
    policy = jsonencode( 
        {
            version = "012-10-17",
            Statement = [
                {
                    Sid         = "PublicReadGetObject",
                    Effect      = "Allow",
                    Principal   = "*",
                    Action      = "s3:GetObject",
                    Resource    = "arn:aws:s3:::${aws_s3_bucket.website.id}/*"
                }
            ]
        }
    )
}
               
        
resource "aws_s3_object" "website_data" {
    bucket = aws_s3_bucket.website.bucket
    source = "../carvilla/index.html"
    key = "index.html"
  
}
resource "aws_s3_object" "website_data" {
    bucket = aws_s3_bucket.website.bucket
    source = "../carvilla/style.css"
    key = "style.css"
  
}
# resource "aws_s3_object" "upload_folder" {
#   for_each = fileset("../carvilla/assets/*", "**")

#   bucket = aws_s3_bucket.website.bucket
#   key    = "assets/${each.value}"
#   source = "../carvilla/assests/*${each.value}"
# }


output "name" {
    value =  random_id.tf_random.hex
  
}


#SEE DOWCUMENT 
# Add websoite configuration
