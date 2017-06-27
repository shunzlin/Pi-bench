#!/bin/bash
#FILE1 = qsort_small.c
#FILE2 = qsort_large.c
target=arm32v7-linux
cd CRC32
ecc -S -emit-llvm -target $target -mfpu=neon *.c
llvm-link *.ll -o all.bc
opt -load libTolerancePass.so -tolerance < all.bc > /dev/null -o all_t.bc
llvm-dis all.bc 
llvm-dis all_t.bc
ecc -S -target $target -mfpu=neon all.bc all_t.bc
ecc -target $target -mfpu=neon all.bc -o all
ecc -target $target -mfpu=neon all_t.bc -o all_t
cd ..