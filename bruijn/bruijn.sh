#!/bin/bash
#
# test fib function in C and expose the generated assembler code
#
gcc -S bruijn.c
gcc -o bruijn bruijn.c
cat bruijn.s
./bruijn
./bruijn 1
./bruijn 2
./bruijn 3
./bruijn 10
