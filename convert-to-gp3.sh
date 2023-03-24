#!/usr/bin/env bash

declare -a volumes=$(aws ec2 describe-volumes --filters Name=volume-type,Values=gp2 | jq -r '.Volumes[].Attachments[].VolumeId')

for volume in $volumes
do
        echo $volume
        aws ec2 modify-volume --volume-id $volume --volume-type gp3
        sleep 10
        echo $(aws ec2 describe-volumes --filters Name=volume-id,Values=$volume | jq -r '.Volumes[].VolumeType')
        echo "------------------------"
done
