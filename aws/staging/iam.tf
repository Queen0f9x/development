resource "aws_iam_user" "test" {
  name = "test-user"
  path = "/"
}

resource "aws_iam_access_key" "test" {
  user = aws_iam_user.test.name
}

data "aws_iam_policy_document" "test_ro" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:Describe*"]
    resources = ["*"]
  }
}

resource "aws_iam_user_policy" "test_ro" {
  name   = "test"
  user   = aws_iam_user.test.name
  policy = data.aws_iam_policy_document.test_ro.json
}
