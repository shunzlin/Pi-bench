#!/bin/sh
cd CrystalMk_v1.0
chmod a+x all all_t
perf stat --repeat 5 -e cycles ./all > output_large.txt
perf stat --repeat 5 -e cycles ./all_t > output_large_t.txt
cd ..