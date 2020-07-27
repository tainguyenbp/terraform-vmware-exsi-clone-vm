#!/bin/bash

/bin/terraform init && sleep 2
/bin/terraform plan && sleep 2
/bin/terraform apply --auto-approve && sleep 2
