## Change runtime type to GPU (Hardware Accelerator)
## Run below mentioned commands to install CUDA on colab VM
! wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
! sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
! sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/3bf863cc.pub
! sudo add-apt-repository "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/ /"
! sudo apt update
! sudo apt install cuda-toolkit-12-2

## Run these to make C/C++ code work in colab 

pip install nvcc4jupyter
%load_ext nvcc4jupyter

## helloworld porgram in C 

%%cuda
#include <stdio.h>
#include <stdlib.h>

int main() {
    printf("Hello world");
    return 0;
}


References:- 

https://nvcc4jupyter.readthedocs.io/en/latest/usage.html#hello-world
https://toranbillups.com/blog/archive/2023/08/19/install-cuda-12-on-popos/
