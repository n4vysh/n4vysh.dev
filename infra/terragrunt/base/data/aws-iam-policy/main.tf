data "aws_iam_policy_document" "github_actions" {
  statement {
    actions = concat(
      # tfstate backend
      # formatlist(
      #   "s3:%s",
      #   concat(
      #     ["ListBucket"],
      #     formatlist(
      #       "%sObject",
      #       [
      #         "Get",
      #         "Put",
      #         "Delete",
      #       ]
      #     )
      #   )
      # ),
      # tfstate lock
      formatlist(
        "dynamodb:%s",
        concat(
          ["DescribeTable"],
          formatlist(
            "%sItem",
            [
              "Get",
              "Put",
              "Delete",
            ]
          )
        )
      ),
      # terraform aws resources
      [
        "acm:*",
        "cloudfront:*",
        "ec2:*",
        "eks:*",
        "elasticloadbalancing:*",
        "iam:*",
        "kms:*",
        "route53:*",
        "s3:*",
        "wafv2:*",
      ],
    )

    resources = ["*"]
  }
}
