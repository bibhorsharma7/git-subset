#!/bin/sh

# remove .legit directory if it exists
if [ -d .legit ]
then
    rm -rf .legit
fi


# errors with legit-add
./legit-init

./legit-add                     #usage error
./legit-add non-existent-file   #error

# show working add and commit
echo "line 1" > a
./legit-add a
./legit-commit -m "first commit"

# commit without legit-add
echo "line 2" >> a
./legit-commit -m "bad commit"  # nothing to commit

./legit-commit -a -m "second commit" #commit 1 as -a option should copy file to index

# usage error for legit-commit
./legit-commit random -arguments
