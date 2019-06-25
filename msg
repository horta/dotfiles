#!/usr/bin/env bash

function err()
{
    RED='\033[0;31m'
    NC='\033[0m'
    printf "${RED}$1${NC}\n"
}

function info()
{
    printf "$1\n"
}

function warn()
{
    DARK='\033[0;90m'
    NC='\033[0m'
    printf "${DARK}$1${NC}\n"
}
