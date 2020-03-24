#!/bin/sh

# remove .legit directory if it exists
if [ -d .legit ]
then
    rm -rf .legit
fi

# tests legit-rm
./legit-init
touch a b c d e
./legit-add a b
./legit-commit -m "Commit-0"
./legit-rm a -random_flag       # usage error
./legit-rm x                    # not in legit repository
./legit-rm c                    # not in legit repository
./legit-rm --cached x           # not in repository

./legit-add c
./legit-rm c                    # error: changes staged
echo "changed" > c
./legit-rm c                    # error: different in all three
./legit-rm --cached c           # error: different in all three

./legit-add d
./legit-commit -m "Commit-1"
echo "changed file d" > d
./legit-rm d                    # different in cur dir & repository

./legit-add e
echo "changed file e" > e
./legit-commit -m "Commit-2"
./legit-add e
./legit-rm e                    # error: changes staged
echo "changed again" > e
./legit-rm e                    # error: different in all three
./legit-rm --cached e           # error: different in all three
