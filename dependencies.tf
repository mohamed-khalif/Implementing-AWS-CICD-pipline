resource "aws_s3_bucket" "codepipeline_terrafrom_s3_bucket" {
  bucket = "codepipeline-terraform-s3-bucket"
}
resource "aws_s3_bucket_acl" "codepipeline_terraform_bucket_acl" {
  bucket = aws_s3_bucket.codepipeline_terrafrom_s3_bucket.id
  acl    = "private"
}
resource "aws_cloudwatch_log_group" "codebuild_terraform_pipeline" {
  name = "codebuild/terraform_pipeline"
}
