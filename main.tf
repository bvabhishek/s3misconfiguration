
provider "aws"{
  region = "us-west-2"
}


resource "aws_s3_bucket" "lab1" {
  bucket = "seasideslab1-${random_string.random_name.result}"
  force_destroy = true
  }


resource "aws_s3_bucket_policy" "lab1_policy" {
  bucket = aws_s3_bucket.lab1.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicAccess",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:*",
      "Resource": "${aws_s3_bucket.lab1.arn}/*"
    },
    {
      "Sid": "PublicWrite-PutObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:PutObject",
      "Resource": "${aws_s3_bucket.lab1.arn}/*"
    },
    {
      "Sid": "AllowListObjects",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:ListBucket",
      "Resource": "${aws_s3_bucket.lab1.arn}"
    }
  ]

}
EOF
}


resource "aws_s3_bucket_public_access_block" "seaslab1" {
  bucket                  = aws_s3_bucket.lab1.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_object" "lab1object" {
  bucket = aws_s3_bucket.lab1.id
  key    = "ssn.jpeg"
  source = "ssn.jpeg"
}

resource "aws_s3_bucket_object" "lab1object2" {
  bucket = aws_s3_bucket.lab1.id
  key    = "emp_pay_dont_delete.csv"
  source = "emp_pay_dont_delete.csv"
}

resource "aws_s3_bucket_object" "lab1object3" {
  bucket = aws_s3_bucket.lab1.id
  key    = "seasides.jpeg"
  source = "seasides.jpeg"
}

resource "aws_s3_bucket_object" "lab1object4" {
  bucket = aws_s3_bucket.lab1.id
  key    = "creds.txt"
  source = "creds.txt"
}

resource "random_string" "random_name" {
  length  = 10
  special = false
  upper   = false
}
