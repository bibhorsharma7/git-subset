#!/bin/sh

# remove .legit directory if it exists
if [ -d .legit ]
then
    rm -rf .legit
fi

# legit-show errors
./legit-init
echo "first line" > a
echo "second line" > b
./legit-add a b
./legit-commit -m "commit 1"
./legit-show :a excess arguments
./legit-show 0:non-existing-file    # file not in commit
./legit-show 1:a                    # no such commit
./legit-show not_a_commit:a         # no such commit
./legit-show randomword             # invalid object
./legit-show c:a:b                  # no commit 'c'
./legit-show 0:a:b                  # invalid filename
./legit-show 0:a                    # should work fine
