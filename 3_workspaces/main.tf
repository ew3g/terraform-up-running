provider "aws" {
  region = "us-east-2"
}

# terraform {
#   backend "s3" {
#     # Use the bucket created on 2_s3_backend_state_files
#     bucket = "terraform-up-and-running-state-my-test-edilson"
#     key    = "workspaces-example/terraform.tfstate"
#     region = "us-east-2"

#     # Use the dynamoDB table created on 2_s3_backend_state_files
#     dynamodb_table = "terraform-up-and-running-locks"
#     encrypt        = true
#   }
# }

resource "aws_instance" "example" {
  ami = "ami-0c55b159cbfafe1f0"
  // ternary operator, if default, the instance is medium, everything else micro
  instance_type = terraform.workspace == "default" ? "t2.medium" : "t2.micro"
}
