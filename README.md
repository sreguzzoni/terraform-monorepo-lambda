# Monorepo Terraform Lambdas

## Description

Monorepo template written in Terraform with the purpose of defining a repo structure able to manage different Lambdas in several environments.
The source code of the functions is managed within the `lambdas` folder.

## Folder Structure

The folder structure of this project is as follows:

```sh
├── bin                       # binary files and executables
├── dev                       # dev terraform files
├── prod                      # prod terraform files
├── qa                        # qa terraform files
├── lambdas                   # folder containing all the lambdas source code
│   ├── function-one
│   └── ...
└── modules                   # terraform modules
```

## Requirements

Before starting you need to:

- Install [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- Install AWS CLI v2
- Setup `.env` files according to your AWS profile

## Check the changes

Once you completed your changes, you can check their impacts on the current infrastructure by launching the commands

```
cd ${ENV}
source .env
terraform init
terraform plan
```

## Apply the changes

If you checked all your changes and you want to apply them, you need to execute the following commands:

```
cd ${ENV}
source .env
terraform init
terraform apply
```