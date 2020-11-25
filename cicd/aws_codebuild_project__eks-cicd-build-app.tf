# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_codebuild_project.eks-cicd-build-app:
resource "aws_codebuild_project" "eks-cicd-build-app" {
  badge_enabled  = false
  build_timeout  = 60
  encryption_key = data.aws_kms_alias.s3.arn
  name           = "eks-cicd-build-app"
  queued_timeout = 480
  depends_on     = [aws_iam_role.codebuild-eks-cicd-build-app-service-role]
  service_role   = aws_iam_role.codebuild-eks-cicd-build-app-service-role.arn
  source_version = "refs/heads/master"
  tags           = {}

  artifacts {
    encryption_disabled    = false
    override_artifact_name = false
    type                   = "NO_ARTIFACTS"
  }

  cache {
    modes = []
    type  = "NO_CACHE"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/amazonlinux2-x86_64-standard:3.0"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = false
    type                        = "LINUX_CONTAINER"
  }

  logs_config {
    cloudwatch_logs {
      status = "ENABLED"
    }

    s3_logs {
      encryption_disabled = false
      status              = "DISABLED"
    }
  }

  source {
    git_clone_depth     = 1
    insecure_ssl        = false
    location            = "https://git-codecommit.eu-west-1.amazonaws.com/v1/repos/eksworkshop-app"
    report_build_status = false
    type                = "CODECOMMIT"

    git_submodules_config {
      fetch_submodules = false
    }
  }

  vpc_config {
    security_group_ids = [
      aws_security_group.sg-08e64dafdccb7c879.id,
    ]
    subnets = [
      aws_subnet.subnet-00cc72ac5b0b79dd4.id,
    ]
    vpc_id = aws_vpc.vpc-026635e1e91a07ddd.id
  }
}
