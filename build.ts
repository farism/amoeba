import { type Build } from 'xbuild';

const build: Build = {
    common: {
        project: 'amoeba',
        archs: ['x64'],
        variables: [],
        defines: ['AM_IMPLEMENTATION'],
        options: [],
        copy: {
            'amoeba/amoeba.h': 'amoeba/amoeba.c',
        },
        libraries: {
            amoeba: {
                sources: ['amoeba/amoeba.c']
            },
        },
        subdirectories: [],
        buildDir: 'build',
        buildOutDir: 'libs',
        buildFlags: []
    },
    platforms: {
        win32: {
            windows: {
                archs: ['Win32', 'x64'],
            },
            android: {
                archs: ['x86', 'x86_64', 'armeabi-v7a', 'arm64-v8a'],
            }
        },
        linux: {
            linux: {},
        },
        darwin: {
            macos: {}
        }
    }
}

export default build;