# scicomp-summer-project

Repository for SciComp 2023 Summer Intern Project.

## User Guideline

### Navigate File System

You may navigate the file system via the command line in the terminal app, or via a File Explorer window which you can open by running `explorer` in the terminal app.

The User home directory can be accessed via two routes, `C:\Users\PhotonUser` or `D:\PhotonUser`. 

The test S3 data bucket that is already mounted for you is available at `C:\s3-mount`, and it contains some sample videos for Sleap and DLC. After actual deployment, the common s3 data buckets will all be mounted under the `C:\` disk, but during the testing phase right now, only the test bucket is mounted. 

The Home Folder is a place to save files that are intended to last over different sessions. It is connected to an S3 bucket that is unique to each user, in other words the Home Folder is not shared between users. The Temporary Folder, on the other hand, stores files that will get cleaned up after you end the session, so you should not assume files in this folder to still exist after you log out and log back in. These folders can be found under `C:\Users\PhotonUser\My Files`, but you can also click on the files icon in the AppStream toolbar to access them. 

### How to Upload/Download files to Cloud

Click the files icon in the AppStream toolbar to open up a window displaying the `Home Folder` and `Temporary Folder`. Drag and drop files to either folders, or use the `Upload files` button on the top right corner to upload files to this cloud instance. You can only access these two particular folders through the files icon, but you may move the files to other locations via other means, such as File Explorer or the command line. However, beware that only the files in the Home Folder are guaranteed to be saved after you log out of the session. 

If you would like to download files, move them to the Home Folder or the Temporary Folder (via the File Explorer or the command line), then click the files icon. Navigate to the file you want to download, and click the drop down button on the right end, and select download. Note that you are only able to download files but not folders in this window. If you would like to download a folder, first zip them (e.g. through File Explorer), move the zip file to Temporary folder (so it gets cleared when you log out), and download the zip file. 

![AppStream Toolbar at Upper Left Corner](appstream-icons.png)

### How to Copy/Paste Text to Cloud

When you first log in to AppStream and the browser prompts for clipboard permissions, click `Allow`, then copy and paste should work as usual. If they still does not work, click the clipboard icon in the AppStream toolbar, and choose `Paste to remote session` or `Copy to local computer` as you desire, and follow the instructions. 


### Sleap GUI

After logging in, select the `Test-Sleap` catalog and choose the `Terminal (SLEAP GUI)` app, which launches the GUI automatically. Alternatively, choose the `Terminal (SLEAP)` app to open a terminal window, and enter the following command to launch the GUI:

```commandline
sleap-label
```

Follow the GUI guidelines to proceed. More detailed guide through the Sleap GUI available [here](https://sleap.ai/tutorials/tutorial.html). 

### DeepLabCut GUI

After logging in, select the `Test-DeepLabCut` catalog and choose the `Terminal (DLC GUI)` app, which launches the GUI automatically. Alternatively, choose the `Terminal (DLC)` app to open a terminal window, and enter the following command to launch the GUI:

```commandline
python -m deeplabcut
```

Follow the GUI guidelines to create a project. The default location of new projects is the User Desktop `D:\PhotonUser/Desktop`, so remember to move your files to Home Folder before leaving. It is recomended to move the files before creating the training dataset so you can run training in Home Folder. You could also move the files before labeling the frames if you are worried about accidentally logging out during labeling. A tutorial of the DLC GUI is available in [this video](https://www.youtube.com/watch?v=KcXogR-p5Ak), and more details are available in [the DLC official webpage](https://deeplabcut.github.io/DeepLabCut/README.html)

NOTE: To add videos, click the `Browse videos` button to open the file selector window. Select the **folder** containing the video files, **NOT** the video file itself, then click `choose` to confirm. Now all video files in that container will be displayed in the GUI, only select the ones you will be analyzing. 

### Git Bash

If you are not familiar with the Windows terminal commands and would like to use Linux commands (e.g. `ls` instead of `dir` to list files in directory), or if you would like to use git operations, you can also launch the Git Bash app. Remember to run `cd ~` first to get to the user home directory. However, Conda environments are only available in the Windows terminal app, so you would not be able to run sleap or deeplabcut through a Git Bash window. 

P.S. This would not be an issue after we switch to using Linux instead of Windows in the future. 

### Chrome

This launches a Google Chrome browser window. This app may be removed in the future. 

### Mount S3 buckets

If you would like to access certain S3 data buckets but they are not already mounted on the `C:\` disk, you may contact the Neural Dynamics Scientific Computing team. 

In case you would like to  mount additional S3 buckets on the file system by yourself, here is how you can do it.

The first option is to mount in the foreground with the following command. This mount process will then occupy the current console. Minimize this console and open another console to run other commands. Terminate the process by typing [ctrl] + [C] in the original console, or by closing the original console to unmount the bucket. Substitute MOUNT_PATH with the path to a non-existing folder name (i.e. you do not need to create the folder beforehand), for example the mount path for the appstream test bucket is `C:\s3-mount`.

```commandline
rclone mount s3:aind-appstream-data-dev-temporary MOUNT_PATH
```

The second option is to mount in the background using the first command below. The console will close immediately and you can open a new console to continue with other commands. Run the second command to unmount all buckets (CAUTION).

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

The `Sleep-Demo.ipynb` notebook contains a simple demonstration of the Sleap Software on a local Windows computer with no GPU support. `sample_data_analysis.h5` is the sample output from the demonstration. 

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
