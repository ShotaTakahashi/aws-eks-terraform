# aws-eks-terraform
This repo is made for Designing Distributed Systems(book). 
Therefore, the name in some files is "designing-distributed-systems".

You can access nodes using SSH.
You should prepare *.tfvars file.
For example:

```
key-name        = "my_key"
public-key-path = "~/.ssh/my_key.pub"
my-ip           = "XXX.XXX.XXX.XXX/32"
```

If you want to set up these, you run:

```
$ terraform init # not necessary
...
$ terraform apply -var-file="terraform.tfvars"
...
```

If you want to remove them, you run:
```
$ terraform destroy
```

## Key
It is easy.
First, make a private key.\
Second, make a public key using the private key.\
Finally, add the name of key to *.tfvars file.

```
$ ssh-keygen -t rsa
...
Enter file in which to save the key (/Users/username/.ssh/id_rsa): /Users/username/.ssh/my_key
...
$ ssh-keygen -y -f ~/.ssh/my_key > my_key.pub
```
