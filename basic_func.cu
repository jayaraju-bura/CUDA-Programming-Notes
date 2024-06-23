%%cuda
#include <stdio.h>
#include <stdlib.h>

__global__ void multiply(int *p, int *q, int*r) {
    *r = (*p) * (*q);
}

int main() {

    int p = 4, q = 5, r = 10;
    int *dev_p, *dev_q, *dev_r;

    int size = sizeof(int);
    cudaMalloc((void **)&dev_p, size);
    cudaMalloc((void **)&dev_q, size);
    cudaMalloc((void **)&dev_r, size);

    cudaMemcpy(dev_p, &p, size, cudaMemcpyHostToDevice);
    cudaMemcpy(dev_q, &q, size, cudaMemcpyHostToDevice);
    cudaMemcpy(dev_r, &r, size, cudaMemcpyHostToDevice);

    multiply <<<1, 1>>> (dev_p, dev_q, dev_r);

    cudaError err = cudaMemcpy(&r, dev_r, size, cudaMemcpyDeviceToHost);

    if (err != cudaSuccess) {
        printf("CUDA Error copying to host :%s\n", cudaGetErrorString(err));
    }

    printf("result is %d ", r);

    cudaFree(dev_p);
    cudaFree(dev_q);
    cudaFree(dev_r);
    return 0;
}
