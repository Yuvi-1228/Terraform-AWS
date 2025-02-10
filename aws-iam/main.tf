terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"
    }
  }
}

provider "aws" {
  region = "us-east-1" #manually single region

}

# Read the yaml data and process 
locals {
  users_data = yamldecode(file("./users.yaml")).users
  user_role_pair = flatten([for user in local.users_data : [for role in user.roles : {
    username = user.username
    role     = role
  }]])
}

output "userdata" {
  #value = local.users_data
  value = local.user_role_pair
  #value = local.users_data[*].username # for specific detail

}

# create user 
resource "aws_iam_user" "userprofile" {
  for_each = toset(local.users_data[*].username)
  name     = each.value

}

#Pass Creation 
resource "aws_iam_user_login_profile" "profile" {
  for_each        = aws_iam_user.userprofile
  user            = each.value.name
  password_length = 12

  lifecycle {
    ignore_changes = [
      password_length,
      password_reset_required,
      pgp_key,
    ]
  }

}

#Attaching Policy 
resource "aws_iam_user_policy_attachment" "policy" {
  for_each = { for pair in local.user_role_pair :
    "${pair.username}-${pair.role}" => pair
  }
  user       = aws_iam_user.userprofile[each.value.username].name
  policy_arn = "arn:aws:iam::aws:policy/${each.value.role}"
}

