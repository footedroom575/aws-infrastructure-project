# AWS S3 Terraform State Storage

[Terraform S3 backend](https://developer.hashicorp.com/terraform/language/settings/backends/s3)

Stores the state as a given key in a given bucket on Amazon S3. This backend also supports state locking and consistency checking via Dynamo DB, which can be enabled by setting the dynamodb_table field to an existing DynamoDB table name. A single DynamoDB table can be used to lock multiple remote state files. Terraform generates key names that include the values of the bucket and key variables.

Configuration: The backend requires the configuration of the AWS Region and S3 state storage. Other configuration, such as enabling DynamoDB state locking, is optional.

To store Terraform state in an Amazon S3 bucket:

Create an S3 bucket in your AWS account to store the Terraform state files.

Modify your Terraform configuration to use the S3 bucket as the backend for storing state. Add a backend block to your Terraform configuration:

```
terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "path/to/my/key"
    region         = "<region>"
  }
}
```

Run terraform init to initialize the backend configuration

Terraform will prompt you to copy the current state to the new backend. Confirm the prompt to migrate the state.

This assumes we have a bucket created called `my-terraform-state-bucket`. The Terraform state is written to the key `path/to/my/key`.

HashiCorp recommends enabling Bucket Versioning on the S3 bucket to allow for state recovery in the case of accidental deletions and human error.

## S3 State Storage

The following configuration is required:

    bucket  (Required) Name of the S3 Bucket.
    key     (Required) Path to the state file inside the S3 Bucket. When using a non-default workspace, the state path will be /workspace_key_prefix/workspace_name/key (see also the workspace_key_prefix configuration).

## S3 Bucket Permissions

Terraform will need the following AWS IAM permissions on the target backend bucket:

    s3:ListBucket on arn:aws:s3:::mybucket
    s3:GetObject on arn:aws:s3:::mybucket/path/to/my/key
    s3:PutObject on arn:aws:s3:::mybucket/path/to/my/key
    s3:DeleteObject on arn:aws:s3:::mybucket/path/to/my/key

This is seen in the following AWS IAM Statement:

```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:ListBucket",
      "Resource": "arn:aws:s3:::mybucket"
    },
    {
      "Effect": "Allow",
      "Action": ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"],
      "Resource": "arn:aws:s3:::mybucket/path/to/my/key"
    }
  ]
}
```

## DynamoDB State Locking

The following configuration is optional:

    dynamodb_endpoint   (Optional, Deprecated) Custom endpoint URL for the AWS DynamoDB API. Use endpoints.dynamodb instead.

    dynamodb_table      (Optional) Name of DynamoDB Table to use for state locking and consistency. The table must have a partition key named LockID with type of String. If not configured, state locking will be disabled.

## DynamoDB Table Permissions

If you are using state locking, Terraform will need the following AWS IAM permissions on the DynamoDB table (`arn:aws:dynamodb:::table/mytable`):

    dynamodb:DescribeTable
    dynamodb:GetItem
    dynamodb:PutItem
    dynamodb:DeleteItem

This is seen in the following AWS IAM Statement:

```

{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "dynamodb:DescribeTable",
        "dynamodb:GetItem",
        "dynamodb:PutItem",
        "dynamodb:DeleteItem"
      ],
      "Resource": "arn:aws:dynamodb:*:*:table/mytable"
    }
  ]
}
```

## Security Recommendation

    IAM Policies:
        Define AWS Identity and Access Management (IAM) policies that grant the necessary permissions for managing the S3 bucket to your team members.
        Use the principle of least privilege, providing only the minimum permissions required for each user or role.

    Bucket Policy:
        Apply an S3 bucket policy to enforce additional access controls. You can define conditions such as IP restrictions or require the use of HTTPS.

    Additional recommendations include S3 bucket encryption to encrypt the stored Terraform state files
