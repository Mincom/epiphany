#!/bin/bash -eu

REPOSITORY_URL=$1

echo "deb [trusted=yes] $REPOSITORY_URL/packages ./" > /etc/apt/sources.list.d/epirepo.list

n=0
until [ "$n" -ge 10 ]
do
    apt update && break
    ps -ef | grep apt
    n=$((n+1))
    sleep 5
done
