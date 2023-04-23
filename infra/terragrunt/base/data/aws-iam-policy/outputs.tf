output "github_actions" {
  value = data.aws_iam_policy_document.github_actions.json
}
