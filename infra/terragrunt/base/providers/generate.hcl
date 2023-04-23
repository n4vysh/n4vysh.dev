generate "aws_provider" {
  path      = "aws.provider.tf"
  if_exists = "overwrite"
  contents  = file("aws.tf")
}

generate "github_provider" {
  path      = "github.provider.tf"
  if_exists = "overwrite"
  contents  = file("github.tf")
}
