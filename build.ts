import { mkdir } from "node:fs/promises";
import { $ } from 'bun';

const extension = Bun.argv[2];

$.nothrow()

for(const config of ['debug', 'release']) {
    for(const platform of ['windows', 'linux', 'macos']) {
        await mkdir(`libs/${config}/${platform}`, {recursive: true})
    }
}

await $`

cp amoeba/amoeba.h amoeba/amoeba.c

cmake -S . -B amoeba/build -DCMAKE_BUILD_TYPE=Debug
cmake --build amoeba/build --config Debug

cp amoeba/build/Debug/amoeba.lib libs/debug/windows
cp amoeba/build/Debug/amoeba.pdb libs/debug/windows
cp amoeba/build/amoeba.a libs/debug/linux
cp amoeba/build/amoeba.a libs/debug/mac

cmake -S . -B amoeba/build -DCMAKE_BUILD_TYPE=Release
cmake --build amoeba/build --config Release

cp amoeba/build/Release/amoeba.lib libs/release/windows/
cp amoeba/build/amoeba.a libs/release/linux/
cp amoeba/build/amoeba.a libs/release/mac

`