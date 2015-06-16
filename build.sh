#!/bin/bash

SYCLPATH="/home/codeplay/proj/ComputeCpp-15.05-Linux/"
$SYCLPATH/bin/compute++ -I $SYCLPATH/include --std=c++11 -O2 -Wno-ignored-attributes -sycl -intelspirmetadata -emit-llvm -D__DEVICE_SPIR32__ -DBUILD_PLATFORM_SPIR -o main.bc -c main.cpp
g++ -I$SYCLPATH/include -O3 -fopenmp --std=c++11 -include main.sycl main.cpp -c
g++ main.o $SYCLPATH/lib/libSYCL.so -O3 -fopenmp -lstdc++ -lOpenCL -o smallpt
