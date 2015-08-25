Setup for AWS instance g2.2xlarge
--------------------------------
* Set up GPU
  - Install CUDA 6.5 for Ubuntu 14.04
  - Use the run file from [here](http://developer.download.nvidia.com/compute/cuda/6_5/rel/installers/cuda_6.5.14_linux_32.run)
  - Use it to install both the toolkit and the driver (display)
  - Would need to stop display `sudo stop lightdm`
  - Also would need to have kernel source installed
  ```bash
  $ sudo apt-get install linux-headers-3.13.0-61-generic
  ```
Additional details [here](https://github.com/BVLC/caffe/wiki/Install-Caffe-on-EC2-from-scratch-(Ubuntu,-CUDA-7,-cuDNN))

Dependencies
------------

1. Install OpenCV 3.0.0
2. Install Boost 1.57 only. Don't mix with multiple versions. Originally I had 1.54 installed through the package manager and 1.57 locally, and the system would keep crashing while de-serializing the search index with a segmentation fault. Compile everything (including caffe) with only boost 1.57 (or higher). Remove previous version if exists any (can't work with lower).
3. Compile Caffe in `lib/ComputeFeatures/Features/CNN/external/caffe`
4. Install zlib, zmq, lmdb, and set up paths in the Makefiles (for `lib/ComputeFeatures/caffe/Makefile.config`, `lib/ScalableLSH/Deploy/Makefile`) etc
5. LMDB works with version 0.9.15. Remove previous system version and install through the git repo

Update Procedure
----------------

The service runs out of a tmux environment. Use `tmux att -t marinus/imgsearch/full` to connect.
The scripts for updating the index are all in `/mnt/data/ImageSearch/Code/ImageSearch_Marinus/scripts/001_full_search`.

1. Extracting features
  Use `bash computeFeatures.sh <lno>` to extract features for new images. Look inside the script for the various optios: It expects the paths to the new images in `/mnt/data/ImageSearch/Data/Images/lists/Images_ext.txt` file (it's specified with a `-n` flag in the call to the update program.
  <lno> is the line number of the first new image in this file that needs to processed.
2. Building index
  Use `bash buildIndex.sh` to update the index. See inside the script for options. It loads the previous index from location specified at (`-l`) and saves a new index to location specified by (`-s`). It remembers the line number of the last image indexed, so will only index if it sees more lines in the `Images.txt` file. 
