#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

yum install unzip -y

unzip -o $CURRENT_DIR/terraform_0.11.14_linux_amd64.zip -d /bin/
terraform version
