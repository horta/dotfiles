#!/usr/bin/env bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source $BASEDIR/msg

if ! apt-get update -q
then
    err "<apt-get update> failed."
    exit 1
fi

if ! apt-get upgrade -q -y
then
    err "<apt-get upgrade> failed."
    exit 1
fi

if ! apt-get install -q -y fish curl vim
then
    err "<apt-get install> failed."
    exit 1
fi
