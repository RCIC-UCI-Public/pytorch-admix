#!/usr/bin/env python

from __future__ import print_function
import torch
x = torch.rand(5, 3)
print ("Contents of x=torch.rand(3,5): ")
print(x)

print ("Cuda is availalbe:", torch.cuda.is_available())
