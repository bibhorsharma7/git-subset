#!/bin/sh

# remove .legit directory if it exists
if [ -d .legit ]
then
    rm -rf .legit
fi

# test legit-add, legit-commit -a and legit-show

./legit-init
touch a b
./legit-add a b
./legit-commit "first commit"       # usage error
./legit-commit -c -m "first commit" # usage error

./legit-commit -m "first commit"    # should work
echo "changed" > a
rm b
./legit-commit -a -m "second commit"
./legit-show :a
./legit-show 1:a
./legit-show :b
./legit-show 1:b
