package main

# Deny if an S3 bucket is public
deny contains msg if {
  some i
  input.resource_changes[i].type == "aws_s3_bucket"
  input.resource_changes[i].change.after.acl == "public-read"
  msg := sprintf("Bucket %v cannot be public", [input.resource_changes[i].change.after.bucket])
}

# Deny if Environment tag is missing
deny contains msg if {
  some j
  input.resource_changes[j].type == "aws_s3_bucket"
  not input.resource_changes[j].change.after.tags.Environment
  msg := sprintf("Bucket %v is missing Environment tag", [input.resource_changes[j].change.after.bucket])
}
