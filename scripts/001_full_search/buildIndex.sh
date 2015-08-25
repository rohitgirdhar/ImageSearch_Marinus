CODE_PATH=/mnt/data/ImageSearch/Code/ImageSearch_Marinus/lib/ScalableLSH/DiskE2LSH
export LD_LIBRARY_PATH=/mnt/data/Softwares/CPP/lmdb/libraries/liblmdb:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/mnt/data/Softwares/CPP/zlib/install/lib/:$LD_LIBRARY_PATH
nice -n 10 $CODE_PATH/buildIndex.bin \
    -d /mnt/data/ImageSearch/Data/Features/CNN/pool5_normed_compressed/ \
    -n /mnt/data/ImageSearch/Data/Images/lists/Images_ext.txt \
    -l /mnt/data/ImageSearch/Data/Search/indexes/fullImg_ITQ_256bit.index.test \
    -s /mnt/data/ImageSearch/Data/Search/indexes/fullImg_ITQ_256bit.index.test.2 \
    -b 256 \
    -t 1 \
    -a 900 \
    --compressedFeatStor
