# S3 Misconfiguration

* Install Checkov tool

```bash
    $pip3 install checkov
```
* Step 1: Change Directory

```bash
cd /terraform-evaluation/lab1
```
* Step 2: Run Checkov tool 

```bash
$ checkov -d .
```

* Step 3: Run `terraform apply -auto-approve`

```bash
terraform apply -auto-approve
```

* Step 4: Comment line number 10 and Uncomment line number 11

  -minimum_password_length = 1
  #minimum_password_length = 14

* Step 5: Re-run Checkov
```bash
checkov -d .
```

* Step 6: You will see that the check is cleared 

* By this you can secure your code even before deploying the resources 
