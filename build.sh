cmake -S . -B amoeba/build -DCMAKE_BUILD_TYPE=Debug
cmake --build amoeba/build --config Debug

cmake -S . -B amoeba/build -DCMAKE_BUILD_TYPE=Release
cmake --build amoeba/build --config Release