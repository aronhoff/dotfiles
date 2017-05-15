# Simple script to compile color_coded vim plugin
cd "../vim/bundle/color_coded"
rm -rf "build"
mkdir "build"
cd "build"
cmake .. -DDOWNLOAD_CLANG=0
make && make install && make clean
