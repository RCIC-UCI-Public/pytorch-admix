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
- ~3hrs for building pytorch RPM 
- ~11hrs for building pytorch-cuda RPM 
- need pytorch to build vision (torchvision)
  need pytorch-cuda to build CUDA-enabled vision-cuda (torchvision)

It is important to have ninja installed before building pytorch.
Ninja is prpvoided by foundation-ninja RPM from foundation-admix.
Without ninja the build time doubles as cmake does a re-do
of all the build objects during the "install" stage. 

