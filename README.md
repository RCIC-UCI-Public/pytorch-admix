# pytorch-admix
Admix for pytorch 

## Info links

- git repo https://github.com/pytorch/pytorch
  from there in Getting Started:

  - tutorials: https://pytorch.org/tutorials
  - examples: https://github.com/pytorch/examples
  - the API reference https://pytorch.org/docs/

## Notes

On a VM with 2CPU and 8Gb memory it takes 
- for building pytorch RPMs:

  - ~3hrs for pytorch
  - ~11hrs for pytorch-cuda
  - 11Gb of space in BUILD/

  It is important to have ninja installed before building pytorch.
  Ninja is provided by foundation-ninja RPM from foundation-admix.
  Without ninja the build time for pytorch and pytorch-cuda doubles 
  as cmake is rebuilding all the objects created during the "build"
  stage again in the "install" stage. 

- for building torchvision:

  - need pytorch to build vision
  - need pytorch-cuda to build CUDA-enabled vision-cuda 


