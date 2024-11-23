# 1. Create IAM Role (Optional, for users to assume a role, if needed)
resource "aws_iam_role" "my_role" {
  name               = "my_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = "*"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# 2. Create IAM Users
resource "aws_iam_user" "user_1" {
  name = "user1"
}

resource "aws_iam_user" "user_2" {
  name = "user2"
}

resource "aws_iam_user" "user_3" {
  name = "user3"
}

resource "aws_iam_user" "user_4" {
  name = "user4"
}

# 3. Create Policies (Full Access to EC2 and S3)
resource "aws_iam_policy" "s3_full_access" {
  name        = "S3FullAccessPolicy"
  description = "Full access to S3"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "s3:*"
        Resource = "arn:aws:s3:::*"
      }
    ]
  })
}

resource "aws_iam_policy" "ec2_full_access" {
  name        = "EC2FullAccessPolicy"
  description = "Full access to EC2"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "ec2:*"
        Resource = "*"
      }
    ]
  })
}

# 4. Attach Policies to Users
resource "aws_iam_user_policy_attachment" "user_1_s3" {
  user       = aws_iam_user.user_1.name
  policy_arn = aws_iam_policy.s3_full_access.arn
}

resource "aws_iam_user_policy_attachment" "user_1_ec2" {
  user       = aws_iam_user.user_1.name
  policy_arn = aws_iam_policy.ec2_full_access.arn
}

resource "aws_iam_user_policy_attachment" "user_2_s3" {
  user       = aws_iam_user.user_2.name
  policy_arn = aws_iam_policy.s3_full_access.arn
}

resource "aws_iam_user_policy_attachment" "user_2_ec2" {
  user       = aws_iam_user.user_2.name
  policy_arn = aws_iam_policy.ec2_full_access.arn
}

resource "aws_iam_user_policy_attachment" "user_3_s3" {
  user       = aws_iam_user.user_3.name
  policy_arn = aws_iam_policy.s3_full_access.arn
}

resource "aws_iam_user_policy_attachment" "user_3_ec2" {
  user       = aws_iam_user.user_3.name
  policy_arn = aws_iam_policy.ec2_full_access.arn
}

resource "aws_iam_user_policy_attachment" "user_4_s3" {
  user       = aws_iam_user.user_4.name
  policy_arn = aws_iam_policy.s3_full_access.arn
}

resource "aws_iam_user_policy_attachment" "user_4_ec2" {
  user       = aws_iam_user.user_4.name
  policy_arn = aws_iam_policy.ec2_full_access.arn
}

# 5. Output the IAM User and Role details
output "iam_user_names" {
  value = [
    aws_iam_user.user_1.name,
    aws_iam_user.user_2.name,
    aws_iam_user.user_3.name,
    aws_iam_user.user_4.name
  ]
}

output "iam_role_name" {
  value = aws_iam_role.my_role.name
}
