#!/bin/sh

# remove .legit directory if it exists
if [ -d .legit ]
then
    rm -rf .legit
fi

# test legit-status with legit-rm, rm
./legit-init
touch a b c d e f
./legit-add a b c d e f
./legit-commit -m "first commit"

echo "some line" > a
echo "some line" > b
echo "some line" > c

./legit-add a b
echo "changed line" > a
rm d
./legit-rm e
./legit-add f
./legit-status
./legit-rm --cached f
./legit-status
./legit-rm --force a
./legit-status
./legit-rm --force --cached b
./legit-status
./legit-rm --force c
./legit-status
echo "changed again" > a
./legit-add a
./legit-status
