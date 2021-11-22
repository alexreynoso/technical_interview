resource "aws_iam_user" "this" {
  name = "tech-int"

  tags = {
    tag-key = "IAM user for technical interview"
  }
}
resource "aws_iam_user_login_profile" "this" {
  user                    = aws_iam_user.this.name
  pgp_key                 = "keybase:alex529a"
  password_reset_required = false
}
resource "aws_iam_access_key" "this" {
 user    = aws_iam_user.this.name
 pgp_key = "keybase:alex529a"
}


resource "aws_iam_user_policy" "this" {
  name = "tech_int-policy"
  user = aws_iam_user.this.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:*",
        "iam:*",
        "s3:*",
        "ssm:*",
        "ec2:DescribeInstances",
        "ec2-instance-connect:SendSSHPublicKey"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
