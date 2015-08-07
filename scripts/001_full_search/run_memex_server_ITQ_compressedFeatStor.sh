BASE_PATH=/mnt/data/ImageSearch/Code/ImageSearch_Marinus/lib/ComputeFeatures/Features/CNN
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${BASE_PATH}/external/caffe/build/lib/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/mnt/data/Softwares/CPP/zmq/install/lib/
export LD_LIBRARY_PATH=/mnt/data/Softwares/CPP/boost/boost_1_57_0/stage/lib/:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/mnt/data/Softwares/Vision/opencv/install/lib/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/mnt/data/Softwares/CPP/lmdb/libraries/liblmdb/
CODE_DIR=/mnt/data/ImageSearch/Code/ImageSearch_Marinus/lib/ScalableLSH/Deploy/
GLOG_logtostderr=1 $CODE_DIR/computeFeatAndSearch.bin \
    -n deploy.prototxt \
    -m /mnt/data/ImageSearch/Data/Models/bvlc_reference_caffenet.caffemodel \
    -l pool5 \
    -i /mnt/data/ImageSearch/Data/Search/indexes/fullImg_ITQ_256bit.index \
    -s /mnt/data/ImageSearch/Data/Features/CNN/pool5_normed_compressed \
    --compressedFeatStor \
    --imgslist /mnt/data/ImageSearch/Data/Images/lists/Images.txt \
    --port-num 5555 \
    --nRerank 1000
