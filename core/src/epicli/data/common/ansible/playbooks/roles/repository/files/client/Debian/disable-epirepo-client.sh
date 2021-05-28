#!/bin/bash -eu

rm -f /etc/apt/sources.list.d/epirepo.list
n=0
until [ "$n" -ge 10 ]
do
    apt-get clean && break
    ps -ef | grep apt
    n=$((n+1))
    sleep 5
done
n=0
until [ "$n" -ge 10 ]
do
    apt update && break
    ps -ef | grep apt
    n=$((n+1))
    sleep 5
done
