output "S3bucket_name"{
    value = aws_s3_bucket.lab1.bucket
}

output "s3BucketArn" {
  value = aws_s3_bucket.lab1.arn
}
