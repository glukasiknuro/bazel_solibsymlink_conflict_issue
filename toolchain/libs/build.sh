#!/bin/bash
set -exu

gcc -c -Wall -Werror -fpic foo.c -o foo.so

gcc -c -Wall -Werror foo.c -o foo.o
ar rcs foo.a foo.o
rm foo.o
