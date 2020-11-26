# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_iam_role_policy.eksctl-mycluster1-nodegroup-ng-ma-NodeInstanceRole-1GFKA1037E1XO__eksctl-mycluster1-nodegroup-ng-maneksami2-PolicyCertManagerGetChange:
resource "aws_iam_role_policy" "eksctl-mycluster1-nodegroup-ng-ma-NodeInstanceRole-1GFKA1037E1XO__eksctl-mycluster1-nodegroup-ng-maneksami2-PolicyCertManagerGetChange" {
  name = "eksctl-mycluster1-nodegroup-ng-maneksami2-PolicyCertManagerGetChange"
  policy = jsonencode(
    {
      Statement = [
        {
          Action = [
            "route53:GetChange",
          ]
          Effect   = "Allow"
          Resource = "arn:aws:route53:::change/*"
        },
      ]
      Version = "2012-10-17"
    }
  )
  role = aws_iam_role.eksctl-mycluster1-nodegroup-ng-ma-NodeInstanceRole-1GFKA1037E1XO.id
}