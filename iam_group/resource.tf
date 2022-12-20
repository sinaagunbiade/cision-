resource "aws_iam_role" "name" {
  name = "prod-ci-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "AWS": "arn:aws:iam::${var.account_id}:root"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "name" {
  name = var.policy_name
  path = "/"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Deny",
            "Action": "*",
            "Resource": "*"
        }
    ]
}
EOF
}



resource "aws_iam_group" "name" {
  name = var.group_name
  path = "/"
}

resource "aws_iam_group_policy_attachment" "name" {
  group = aws_iam_group.name.name
  policy_arn = aws_iam_policy.name.arn
}

resource "aws_iam_user" "ci_user" {
  name =  "prod_ci_user"
  path = "/"
  
}

resource "aws_iam_group_membership" "name" {
  name = "var.group_member"
  users = [aws_iam_user.ci_user.name]
  group = aws_iam_group.name.name
}
