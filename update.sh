#!/bin/bash

imc_url=https://github.com/lsts/imc.git
imc_branch=master

shopt -s extglob 
rm -rfv !("update.sh")

git clone --branch "$imc_branch" $imc_url imc_git && \
python3 imc_git/doc/generate.py && cp -rv imc_git/doc/reference/* . && \
rm -rf imc_git
