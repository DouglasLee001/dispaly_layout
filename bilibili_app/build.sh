rm -r build
mkdir build
cd build
emcmake cmake ..
emmake make -j
cp ./ind_cpp.* ../display