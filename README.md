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
cd s3misconfiguration/
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

* Step 8: Lets first download the fishy files - to your current working directory

```bash
aws s3 cp s3://$s3bucket/creds.txt . --no-sign-request --region us-west-2

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

# Defence with Encryption

Using Server Side encryption with Customer provided keys.

Step 1: Create a secrete file called secret.txt

```bash
echo "Welcome to Seasides, Your secret coupon is HASDJFH324878QWER" > secret.txt
```
Step 2: Lets generate a ecnryption key with AES-128-CBC encryption algorithm with openssl
note openssl is a widely used open-source cryptographic library and toolset

```bash
openssl enc -aes-128-cbc -k secret -P
```
Step 3: lets make the key an environmental variable

```bash
export key=<value of key>
```
Step 4: Lets upload the secret file along with the header encryption key
```bash
aws s3 cp secret.txt s3://$s3bucket/ --sse-c --sse-c-key $key
```

Now, Go to the console and try to access or view the secret file 

Step 5: Try to download the secret file 

```bash
aws s3 cp s3://$s3bucket/secret.txt .
```
It is clear that
* we wont be able to retrive or access those objects which have client side encryption.
* we wont be able to view the encrypted object in AWS Console

Step 6: Lets retrive it with our encryption key

```bash
aws s3 cp s3://$s3bucket/secret.txt . --sse-c --sse-c-key $key
```
Destroy the resources
```bash
terraform destroy -auto-approve
```
