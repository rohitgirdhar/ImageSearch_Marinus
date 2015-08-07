Dependencies
------------

1. Install OpenCV 3.0.0
2. Install Boost 1.57 only. Don't mix with multiple versions. Originally I had 1.54 installed through the package manager and 1.57 locally, and the system would keep crashing while de-serializing the search index with a segmentation fault. Compile everything (including caffe) with only boost 1.57 (or higher). 
3. Compile Caffe in `lib/ComputeFeatures/Features/CNN/external/caffe`
4. Install zlib, zmq, lmdb
