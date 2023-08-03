xhost local:root

# Download libtorch (C++) with CUDA 11.8 support 
wget https://download.pytorch.org/libtorch/cu118/libtorch-cxx11-abi-shared-with-deps-2.0.1%2Bcu118.zip

# unzip libtorch library 
unzip libtorch-cxx11*

# remove zip file
rm -rf libtorch-cxx11*

# make lib folder
mkdir -p lib

# move libtorch to lib folder 
mv libtorch lib/

# build docker image
docker-compose build