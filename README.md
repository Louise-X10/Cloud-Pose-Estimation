# scicomp-summer-project

Repository for SciComp 2023 Summer Intern Project.

## User Guideline

### Navigate File System

The User home directory can be accessed via two routes, `C:\Users\PhotonUser` or `D:\PhotonUser`. 

The test S3 bucket that is already mounted for you is available at `C:\s3-mount`, and it contains some sample videos for Sleap and DLC. After actual deployment, the common s3 data buckets will all be mounted under the `C:\` disk, but during the testing phase right now, only the test bucket is mounted. 

To upload / download files between the cloud instance and your local computer, click on the files icon on the top left corner. It will open up a window showing two folders, `Home Folder` and `Temporary Folder`. These folders can also be found under `C:\Users\PhotonUser\My Files`. The `Home Folder` is connected to an S3 bucket unique to each user, so everything stored in this home folder persists over sessions, and is not shared between users. On the other hand, things stored in the Temporary folder may not persist over different instances (e.g. if you log off and then log in again, do not assume files in the Temporary folder still exists). 

![AppStream Icons at Upper Left Corner](appstream-icons.png)

### How to Copy/Paste to Cloud

When the browser prompts for clipboard permissions, click `Allow`. If copy and pasting still does not work, click the clipboard icon on the top left corner, and choose `Paste to remote session` or `Copy to local computer` as you desire, and follow the instructions. 


### Sleap GUI

Open the Anaconda Prompt app, and enter the following in the command line:

```commandline
sleap-label
```

Follow the GUI guidelines to proceed. More detailed guide through the Sleap GUI available [here](https://sleap.ai/tutorials/tutorial.html). 

### DeepLabCut GUI

Open the Anaconda Prompt app, and enter the following in the command line:

```commandline
python -m deeplabcut
```

Follow the GUI guidelines to create a project. The default location of new projects is the User Desktop `D:\PhotonUser/Desktop`. More detailed guide through the DLC GUI is available [here](https://deeplabcut.github.io/DeepLabCut/docs/PROJECT_GUI.html)

NOTE: To add videos, click the `Browse videos` button to open the file selector window. Select the **folder** containing the video files, and click `choose` to confirm. Now all video files in that container will be displayed in the GUI, only select the ones you will be analyzing. 

### Git Bash

If you would like to use git operations, or if you are not familiar with the Windows terminal commands, you can also launch the Git Bash app. Remember to run `cd ~` first to get to the user home directory. However, Conda operations are only available in the Windows terminal app and not available on Git Bash. 

### Mount S3 buckets

If you want to mount additional S3 buckets on the file system, you can do so in the foreground with the following command. This process will then occupy the current console. Minimize this console and open another console to run other commands. Terminate the process by typing [ctrl] + [C] in the original console, or by closing the original console to unmount the bucket. Here is an example of mounting the appstream test bucket to the MOUNT_PATH `C:\s3-mount`. 

```commandline
rclone mount s3:aind-appstream-data-dev-temporary MOUNT_PATH
```

You can also mount them in the background with the first command. The console will close immediately and you can open a new console to continue with other commands. Run the second command to unmount all buckets. Here is an example of mounting the appstream test bucket to the MOUNT_PATH `C:\s3-mount`. 

```commandline
rclone mount s3:aind-appstream-data-dev-temporary MOUNT_PATH --no-console

taskkill /F /IM rclone.exe
```


## Developer Guideline

If you are not familiar with AppStream, `Appstream-Intro.ipynb` contains a brief overview of AppStream's basic terminology and covers some features of AppStream that has been explored during this project. 

These notebooks have instructions on buiding different kinds of images for AppStream. 

- `Sleap-Windows-Report.ipynb`: Has the most detailed guide of image building process for Windows platform
- `Rclone-Windows-Report.ipynb`
- `DLC-Windows-Report.ipynb`
- `Rclone-Sleap-Linux-Report.ipynb`

The `Sleep-Demo.ipynb` notebook contains a simple demonstration of the Sleap Software on a local Windowd computer with no GPU support. `sample_data_analysis.h5` is the sample output from the demonstration. 

The `AppStream-WorkInProgress.ipynb` contains work that are still in progress or work that is already depracated. Attempts at AppStream that have been tried but failed are logged here. 


### Environment Installation

Here are instructions to set up two separate virtual environments for running the jupyter notebook and SLEAP respectively. These instructions work on a Windows 10 machine. 
If you are using a different machine, checkout more detailed instructions to install SLEAP [here](https://sleap.ai/develop/installation.html)

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
conda create -y -n jupyter jupyter=1.0.0 nb_conda_kernel
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
