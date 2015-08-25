if [ $# -lt 1 ]; then
  echo 'Enter the starting line number'
  exit -1
fi

CODE_PATH=/mnt/data/ImageSearch/Code/ImageSearch_Marinus/lib/ComputeFeatures/Features/CNN/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${CODE_PATH}/external/caffe_dev_MemLayerWithMat/build/lib/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/mnt/data/Softwares/CPP/lmdb/libraries/liblmdb/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/mnt/data/Softwares/Vision/opencv/install/lib/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-6.5/lib64/
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${CODE_PATH}/external/caffe/build/lib/
${CODE_PATH}/computeFeaturesFullImg.bin \
    -i /mnt/data/ImageSearch/Data/Images/corpus \
    -q /mnt/data/ImageSearch/Data/Images/lists/Images_ext.txt \
    -n deploy.prototxt \
    -m /mnt/data/ImageSearch/Data/Models/bvlc_reference_caffenet.caffemodel \
    -l pool5 \
    -o /mnt/data/ImageSearch/Data/Features/CNN/pool5_normed_compressed \
    -y \
    -t lmdb \
    -s ${1} \
    --compressedFeatStor
