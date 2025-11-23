#!/bin/bash

account_id=$(aws sts get-caller-identity --query Account --output text)
region=$(aws configure get region)
role_name=$(
	aws iam list-roles \
		--query "Roles[?starts_with(RoleName, 'AWSReservedSSO_')].RoleName" \
		--output text
)
sso_role_name="aws-reserved/sso.amazonaws.com/$region/$role_name"
name=sops
id=$(
	aws kms list-aliases \
		--query "Aliases[?AliasName=='alias/$name'].TargetKeyId" \
		--output text
)

if [[ -z $id ]]; then
	echo 'key create'
	id=$(
		aws kms create-key \
			--description "KMS key for SOPS encryption" \
			--tags TagKey=Purpose,TagValue=SOPS TagKey=ManagedBy,TagValue=aws-cli \
			--query 'KeyMetadata.KeyId' \
			--output text
	)

	echo 'alias create'
	aws kms create-alias \
		--alias-name "alias/$name" \
		--target-key-id "$id"
else
	echo 'key and alias already exist'
fi

echo 'update key policy'
aws kms put-key-policy --key-id "$id" --policy file:///dev/stdin <<EOF
{
	"Version": "2012-10-17",
	"Id": "key-default-1",
	"Statement": [
		{
			"Sid": "Enable IAM User Permissions",
			"Effect": "Allow",
			"Principal": {
				"AWS": "arn:aws:iam::$account_id:root"
			},
			"Action": "kms:*",
			"Resource": "*"
		},
		{
			"Sid": "Allow use of the key",
			"Effect": "Allow",
			"Action": [
				"kms:Encrypt",
				"kms:Decrypt",
				"kms:ReEncrypt*",
				"kms:GenerateDataKey*",
				"kms:DescribeKey"
			],
			"Resource": "*",
			"Principal": {
				"AWS": [
					"arn:aws:iam::$account_id:role/$sso_role_name"
				]
			}
		}
	]
}
EOF
