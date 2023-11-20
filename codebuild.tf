#Create codebuild
resource "aws_codebuild_project" "terraform" {
  name          = "terraform_resources"
  description   = "Apply terrafrom resource"
  build_timeout = "5"
  service_role  = aws_iam_role.codebuild_terraform_role.arn
artifacts {
    type = "CODEPIPELINE"
  }
environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:6.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = true
environment_variable {
      name  = "TF_COMMAND"
      value = "apply"
    }
environment_variable {
      name  = "TF_VERSION"
      value = "1.2.7"
    }
  }
logs_config {
    cloudwatch_logs {
      group_name  = "codepipeline"
      stream_name = "terraform"
    }
  }
source {
    type                = "CODEPIPELINE"
    git_clone_depth     = 0
    insecure_ssl        = false
    report_build_status = false
  }
}
