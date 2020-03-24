#!/bin/sh

# remove .legit directory if it exists
if [ -d .legit ]
then
    rm -rf .legit
fi

# errors with add command
./legit-init
touch a b
./legit-add -random_flag a b    # usage error
./legit-add %f                  # invalid filename
./legit-add _f.txt              # invalid filename
./legit-add "\$hello.c"         # invalid filename

mkdir directory
./legit-add directory           # not a regular file
