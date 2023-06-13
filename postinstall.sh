#!/bin/sh

conda create -y -n jupyter jupyter=1.0.0
conda create -y -n sleap -c sleap -c nvidia -c conda-forge sleap=1.3.0
