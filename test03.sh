#!/bin/sh

# remove .legit directory if it exists
if [ -d .legit ]
then
    rm -rf .legit
fi

# check commands that shouldn't work if there are no commits
./legit-init
echo "just a line" > a
./legit-add a
# non of the following should work
./legit-log
./legit-show :a         # should still not work even if its in index
./legit-rm --cached a
./legit-rm --force a
./legit-status

# once initial commit is made, the commands should work
./legit-commit -m "initial commit"
./legit-log
./legit-show :a
./legit-rm --cached a
./legit-rm --force a
./legit-status
