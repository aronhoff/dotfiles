# Simple script to compile color_coded vim plugin
cd "../vim/bundle/color_coded"
rm -rf "build"
mkdir "build"
cd "build"
cmake ..
make && make install && make clean && make clean_clang
