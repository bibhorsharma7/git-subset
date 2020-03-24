#!/bin/sh

# remove .legit directory if it exists
if [ -d .legit ]
then
    rm -rf .legit
fi

# test valid legit-rm commands with --force flag

./legit-init
touch a b c d e f g
./legit-add a b c
./legit-commit -m "first commit"
./legit-rm --cached a
./legit-add a
./legit-rm a
rm b
./legit-rm b
rm c
./legit-rm --cached c
./legit-add d
./legit-rm --force d
touch d
./legit-add d
echo "changed file d" > d
./legit-rm --force d
./legit-add e
./legit-commit -m "second commit"
echo "changed" > e
./legit-rm --force e
./legit-add f
echo "changed file f" > f
./legit-commit -m "third commit"
./legit-add f
./legit-rm --force f
./legit-add g
echo "file changed g" > g
./legit-commit -m "fourth commit"
./legit-add g
echo "changed again" > g
./legit-rm --force --cached g
