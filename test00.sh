#!/bin/sh

# delete .legit directory if it already exists
if [ -d ".legit" ]
then
    rm -rf .legit
fi

#test legit-init error messages and usage

./legit-init usage error
./legit-init

# should produce an error for existing directory
./legit-init

# remove directory to test other legit commands without .legit
rm -rf .legit/
#following commands should produce an error for no repository
./legit-add
./legit-commit
./legit-log
./legit-show
