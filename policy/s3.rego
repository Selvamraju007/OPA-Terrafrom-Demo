
package terraform.s3

deny[msg] {
  some resource
  resource := input.resource_changes[_]
  resource.type == "aws_s3_bucket"
  resource.change.after.acl == "public-read"
  msg := sprintf("Bucket %v cannot be public", [resource.change.after.bucket])
}

deny[msg] {
  some resource
  resource := input.resource_changes[_]
  resource.type == "aws_s3_bucket"
  not resource.change.after.tags.Environment
  msg := sprintf("Bucket %v missing Environment tag", [resource.change.after.bucket])
}
