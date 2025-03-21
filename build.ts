import os from "node:os";
import { mkdir } from "node:fs/promises";
import { $ } from "bun";

const PLATFORM = os.platform();
const ARCH = os.arch();
const DEBUG = "debug";
const RELEASE = "release";

$.nothrow();

for (const config of [DEBUG, RELEASE]) {
  await mkdir(`libs/${config}/${PLATFORM}_${ARCH}`, { recursive: true });
}

await $`

cp amoeba/amoeba.h amoeba/amoeba.c

cmake -S . -B amoeba/build -DCMAKE_BUILD_TYPE=Debug
cmake --build amoeba/build --config Debug

cp amoeba/build/Debug/amoeba.lib libs/${DEBUG}/${PLATFORM}_${ARCH}
cp amoeba/build/Debug/amoeba.pdb libs/${DEBUG}/${PLATFORM}_${ARCH}
cp amoeba/build/amoeba.a libs/${DEBUG}/${PLATFORM}_${ARCH}

cmake -S . -B amoeba/build -DCMAKE_BUILD_TYPE=Release 
cmake --build amoeba/build --config Release

cp amoeba/build/Release/amoeba.lib libs/${RELEASE}/${PLATFORM}_${ARCH}
cp amoeba/build/amoeba.a libs/${RELEASE}/${PLATFORM}_${ARCH}

`;
