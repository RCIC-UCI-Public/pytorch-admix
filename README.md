# pytorch-admix
Admix for pytorch 

## Info links

- git repo https://github.com/pytorch/pytorch
  from there in Getting Started:

  - tutorials: https://pytorch.org/tutorials
  - examples: https://github.com/pytorch/examples
  - the API reference https://pytorch.org/docs/

## Notes

- Building RPMS on a VM with 2CPU and 8Gb memory requires:

  - 3hrs  + 3Gb  space in BUILD for pytorch
  - 11hrs + 11Gb space in BUILD for pytorch-cuda


- Building on a VM with 16CPU and 16Gb memory failed for pytorch-cuda due to
  some compilations processes being killed by the OS for luck of memory. 
  The build uses all available CPUs and all available memory. 
  After adding a 4Gb swap space the build was successful:
  
  - ~0.5hr for pytorch
  - ~2hrs  for pytorch-cuda  

- It is important to have ninja installed before building pytorch.
  Ninja is provided by foundation-ninja RPM from foundation-admix.
  Without ninja the build time for pytorch and pytorch-cuda doubles 
  as cmake is rebuilding all the objects created during the "build"
  stage again in the "install" stage.

- for building torchvision:

  - need pytorch to build vision
  - need pytorch-cuda to build CUDA-enabled vision-cuda 


