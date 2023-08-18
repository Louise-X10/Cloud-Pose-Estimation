# scicomp-summer-project

Repository for SciComp 2023 Summer Intern Project.

## Repo Overview

- `docs`: guides and notebooks on AppStream, both for developers and for users
- `poster`: a poster summarizing results of this project
- `Sleap-Demo.ipynb`, `sample_analysis_data.h5`: a short demonstration of how to use SLEAP, and a sample results file
- `Compare-Sleap.ipynb`, `sleap-mouse-topview`: a notebook on SLEAP training in AppStream (for comparison with DLC), and the files generated from this process
- `Compare-DLC.ipynb`, `dlc-prelabeled-Pranav-2023-07-27`: a notebook on DLC training in AppStream (for comparison with SLEAP), and the files generated from this process


## Developer Guideline

If you are not familiar with AppStream, checkout `AppStream-Developer-Intro.ipynb`, which contains a brief overview of AppStream's basic terminology and covers some features of AppStream that has been explored during this project. 

The `AppStream-Image-Builder-Guide.ipynb` illustrates the general steps to building a custom image in AppStream. There are also several notebooks with specific instructions on buiding different kinds of images in AppStream. 

- `Sleap-Windows-Report.ipynb`: Has the most detailed run through each step of image building process on Windows platform
- `Rclone-Windows-Report.ipynb`
- `DLC-Windows-Report.ipynb`
- `Rclone-Sleap-Linux-Report.ipynb`

The `Sleep-Demo.ipynb` notebook contains a simple demonstration of the Sleap Software on a local Windows computer with no GPU support. `sample_data_analysis.h5` is the sample output from the demonstration. 

The `AppStream-DepracatedWorks.ipynb` contains some documentation of the options that have been tried for this project but did not work out. 

### Environment Installation

Here are instructions to set up two separate virtual environments for running the jupyter notebook and SLEAP respectively on your local computer. These instructions work on a Windows 10 machine. 
If you are using a different machine, checkout more detailed instructions to install SLEAP [here](https://sleap.ai/develop/installation.html). 

If you would like to install DeepLabCut on your local computer, please check out their [installation guide](https://github.com/DeepLabCut/DeepLabCut/blob/main/docs/installation.md). Alternatively, you could also checkout the instructions of [installing DLC in AppStream](./docs/Windows-DLC-Image.ipynb), which should be similar to how you would install DLC on a local Windows computer. 

1. Install via Shell script

```commandline
source postinstall.sh
```

2. Install via YAML file

This method only works for setting up the jupyter environment. This method may not work if you are using a MAC with M1 chip. 

```commandline
conda env create -f jupyter_environment.yml
conda activate jupyter
conda install nb_conda_kernel
```

3. Install via command line

If none of the above methods work, try installing manually by running the commands below.

```commandline
conda create -y -n jupyter jupyter=1.0.0 nb_conda_kernels
conda create -y -n sleap -c sleap -c nvidia -c conda-forge sleap=1.3.0 ipykernel
```

### Environment Activation

To view the jupyter notebook, use the jupyter environment and open the notebook as follows.

```commandline
conda activate jupyter
jupyter notebook
```

To follow through the SLEAP demo, you can either create a jupyter notebook using the `Python[conda env: sleap]` kernel, or activate the sleap environment in the terminal and open the SLEAP GUI as follows.

```commandline
conda activate sleap
sleap-label
```
