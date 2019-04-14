# Terraform AWS playground

[![Build Status](https://travis-ci.org/robcharlwood/terraform-aws-playground.svg?branch=master)](https://travis-ci.org/robcharlwood/terraform-aws-playground/)

A simple codebase for experimentation and playing around with Terraform and AWS. This code is provided for educational uses only and is not recommended for production setups.

## Initial checkout and setup of codebase

* Open terminal and move to a suitable directory on your machine
* Run ``git clone git@github.com:robcharlwood/terraform-aws-playground.git``
* Run ``cd terraform-aws-playground``

### Installation and Step by Step Example

* Create an [AWS Free Tier](https://aws.amazon.com/free/) account
* Add a [new user](https://console.aws.amazon.com/iam/home#/users$new?step=details) called ``terraform_user`` and apply ``AdministratorAccess`` group permissions directly and allow programmatic access.
* Download the provided CSV containing the new user's access token and secret key
* Copy the access token and secret key to your aws credentials file (usually ``~/.aws/credentials``)
* Your final credentials file (``~/.aws/credentials``) should look something like this:

    ```
    [terraform]
    region=us-west-2
    aws_access_key_id=ACCESS_KEY_HERE
    aws_secret_access_key=SECRET_ACCESS_KEY_HERE
    ```
* Ensure you have a public key available in your ``~/.ssh/`` directory. If you don't please [add one](https://git-scm.com/book/en/v2/Git-on-the-Server-Generating-Your-SSH-Public-Key) first.

From here, we are now ready to run the codebase installation.
* Run ``make install`` to setup everything with the project defaults
* Run ``make install VENV=foo`` to setup everything into a virtualenv named ``foo``
* Run ``make install PYTHON_EXE=python3.7`` to setup everything with a specific python interpreter. This defaults to ``python3.7``.

Please ensure that you have ``terraform`` installed on your system and that it is on the system path. If you don't yet have terraform installed, you can follow the instructions [here](https://learn.hashicorp.com/terraform/getting-started/install.html)

Please note that this codebase has been checked and works with version ``0.11.13`` of ``terraform``. Use newer versions at your own risk. :)

Finally we can run the terraform code to provision our free tier AWS account

* ``terraform init`` (Initialises Terraform)
* ``terraform fmt`` (Checks our terraform code is formatted correctly)
* ``terraform validate`` (This will warn you if any variables are missing - for example your SSH public key or your AWS credentials)
* ``terraform plan`` (Shows what will happen)
* ``terraform apply`` (Actually runs our plan against our AWS account using the credentials we created and stored above)

Once the provisioning is complete, we need to find the external URL for your new instance. You can get this from the [EC2 instance control panel](https://eu-west-2.console.aws.amazon.com/ec2/v2/home?region=eu-west-2#Instances:sort=desc:instanceState) under "Public DNS (IPv4)".

Now we can connect to our new instance via SSH. I have included an example below with ``X`` placeholders for the dynamic portions of the url based on your own instance. Yours may look similiar to mine, or completely different, if for example; you decide to use a different region to host your EC2 instance.

    ssh ubuntu@ecX-XX-XX-XXX-XXX.eu-west-2.compute.amazonaws.com

You can now play around with your new EC2 instance that was fully setup and configured using infrastructure as code.

### Continuous Integration

This project uses [Travis CI](http://travis-ci.org/) for continuous integration. This platform runs the project tests - this is basically relevant ``terraform`` commands that ensure the terraform code is as valid as it can be.

## Versioning

This project uses [git](https://git-scm.com/) for versioning. For the available versions,
see the [tags on this repository](https://github.com/robcharlwood/terraform-aws-playground/tags).

## Authors

* Rob Charlwood - Bitniftee Limited

## Changes

Please see the [CHANGELOG.md](https://github.com/robcharlwood/terraform-aws-playground/blob/master/CHANGELOG.md) file additions, changes, deletions and fixes between each version

## License

This project is licensed under the MIT License - see the [LICENSE.md](https://github.com/robcharlwood/terraform-aws-playground/blob/master/LICENSE) file for details
