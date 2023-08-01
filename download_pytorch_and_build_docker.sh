xhost local:root

# Download libtorch (C++) with CUDA 11.8 support #
wget https://download.pytorch.org/libtorch/cu118/libtorch-cxx11-abi-shared-with-deps-2.0.1%2Bcu118.zip

# unzip libtorch library #
unzip libtorch-cxx11*

# remove zip file
rm -rf libtorch-cxx11*

# copy libtorch to lib folder #
cp -r libtorch lib/

docker-compose build
docker-compose up -d 