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

  Create 4Gb swap:

  ```bash
  dd if=/dev/zero of=/swapfile count=4096 bs=1MiB
  chmod 600 /swapfile
  mkswap /swapfile
  swapon /swapfile
  swapon -s  # verify
  ```

- It is important to have ninja installed before building pytorch.
  Ninja is provided by foundation-ninja RPM from foundation-admix.
  Without ninja the build time for pytorch and pytorch-cuda doubles
  as cmake is rebuilding all the objects created during the "build"
  stage again in the "install" stage.

- for building torchvision:

  - need pytorch to build vision
  - need pytorch-cuda to build CUDA-enabled vision-cuda

## pytorch-cuda and libcudnn

- cuda 10 and 11 have different required versions of libcudnn ( 7 and 8).
  When both are installed via system RPMs a postscript in RPM runs
  update-alternatives command. By default, the latest version becomes primary.

  In order to compile for centos7 adn cuda10 with older libcudnn7 need to
  configure libcudnn to use older version:

  ```bash
  update-alternatives --config libcudnn
  There are 2 programs which provide 'libcudnn'.

    Selection    Command
  -----------------------------------------------
     1           /usr/include/cudnn_v7.h
  *+ 2           /usr/include/cudnn_v8.h

  Enter to keep the current selection[+], or type selection number:
  ```
  and choose option 1

  Verify that the right version is enabled :

  ```bash
  update-alternatives --list | grep libcudnn
  ```
  After buildling  needed RPMS for centos7 switch the same way to libcudnn8 version.

- in pytorch-cuda keep {{name}} as pytorch so that RPM installs in the same location.
  The conflicts specification makes sure that only one version of pytorch (with cuda or without)
  is installed.

- The filter-requires-pytorch.sh is used only for cuda enabled version in pytorch-cuda.yaml
  The name part that follows  _filter-requires_ corresponds to {{name}} == pytorch

- cuda-enabled versions of pytorch and vision are in respective <name>-cuda.yaml files.
  RPMs names have cuda and its version specified.

## pytorch v2.3.0

Build fails even with 16GB physical + 16G swapfile 
when compiled either with ninja or without (build find ninja in the presense of faoundation module)
Create a pytorch2-cuda.yaml and adjust a few parameters, see notes in the file. 
