#! /usr/bin/env bash

if [ ${#} -ne 3 ]
then
    echo "need 3 params"
    exit
fi

git init

git remote remove origin
git remote add origin $1

git fetch origin
git checkout $2
git merge origin/$2

git checkout $3
git merge origin/$3

git diff --name-only $2 $3 > myfile.txt

git remote remove origin



#rm -rf .git