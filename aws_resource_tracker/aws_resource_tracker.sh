#!/bin/bash

########################
# Author: Prashant Negi
# Date: 7th August 2023
#
# Purpose: This script will report the AWS Resource usage.
# Version: V1
########################

# Set the script in debug mode
set -x

# Exit immediately if any command fails
set -e

# Capture the failure of any command in a pipeline
set -o pipefail

output_file="aws_resource_usage_$(date +'%d-%B-%Y').txt"

# AWS S3
# AWS EC2
# AWS Lambda
# AWS IAM Users

{

	echo "AWS Resource Usage Report - $(date +'%d-%B-%Y')"

	# list s3 buckets
	echo "Print list of s3 buckets"
	aws s3 ls

	# list EC2 instances, parse through the json to only get instance id
	echo "Print list of ec2 instances"
	aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'

	# list lambda functions
	echo "Print list of lambda functions"
	aws lambda list-functions

	# list IAM users
	echo "Print list of IAM users"
	aws iam list-users

} > "$output_file"


echo "Script Successfully executed"
