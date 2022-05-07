cc       = gcc
libs     = -lm -lfftw3
optimize = -O2
options  = -g -Wall -fno-exceptions -std=c99
targets  = bench_fftw.c common.h

nvcc = nvcc
cuda_targets = bench_cufft.cu
cuda_libs = -lcufft
cuda_opts = -arch sm_75

bench: common.h bench_cufft.cu
	$(nvcc) $(cuda_targets) $(cuda_libs) $(cuda_opts) -o bench_cufft

clean:
	rm bench_fftw bench_cufft
