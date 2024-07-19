#!/bin/bash

########################
# Author: Roy
# Date: 2nd Jul
#
# Version: 1
#
# This scpirt will report the AWS resource usage
########################

#AWS S3
#AWS EC2
#AWS Lambda
#AWS IAM Users

#Enable debug mode
set -x

#List S3
echo "List of S3 Buckets"
aws s3 ls

#List EC2 instances
echo "List of EC2 Instances"
aws ec2 describe-instances | jq ".Reservations[].Instances[].InstanceId"

#List Lambda function
echo "List of Lambda Functions"
aws lambda list-functions

#List IAM users
echo "List of IAM Users"
aws iam list-users



