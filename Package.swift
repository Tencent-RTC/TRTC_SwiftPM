// swift-tools-version: 6.0.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TRTC_SwiftPM",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "TRTC_SwiftPM",
            targets: ["TRTC_SwiftPM"]),
        .library(
            name: "TXLiteAVSDK_ReplayKit",
            targets: ["TXLiteAVSDK_ReplayKitExt"]),    
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(
            name: "TXLiteAVSDK_TRTC",
            url: "https://liteav.sdk.qcloud.com/download/spm/13.3/trtc/13.3.0.20845/TXLiteAVSDK_TRTC.xcframework.zip",
            checksum: "22af4347a790f782973899355181d9c460b2e2a816cea74a00626e0ba3ad6bc1"
        ),
        .binaryTarget(
            name: "TXFFmpeg",
            url: "https://liteav.sdk.qcloud.com/download/spm/13.3/trtc/13.3.0.20845/TXFFmpeg.xcframework.zip",
            checksum: "bd9a606e2e74948c25e62361c0daa6ff19bcd03a75ad69965281bc7bddd564be"
        ),
        .binaryTarget(
            name: "TXLiteAVSDK_ReplayKitExt",
            url: "https://liteav.sdk.qcloud.com/download/spm/13.3/trtc/13.3.0.20845/TXLiteAVSDK_ReplayKitExt.xcframework.zip",
            checksum: "43528fac9c85364a6c183ba9710fe81957b8ff9d65eb2499b18beddb21f4ec51"
        ),
        .binaryTarget(
            name: "TXSoundTouch",
            url: "https://liteav.sdk.qcloud.com/download/spm/13.3/trtc/13.3.0.20845/TXSoundTouch.xcframework.zip",
            checksum: "d59e7f6a8f89d411306820d4f4d58f29f4810a12df2bd5688bc8af2ee78794c0"
        ),.target(
            name: "TRTC_SwiftPM",
            dependencies: [
                .target(name: "TXLiteAVSDK_TRTC"),
                .target(name: "TXFFmpeg"),
                .target(name: "TXSoundTouch")
            ],
            sources: ["TRTC_SwiftPM.swift"],
            linkerSettings: [
                .linkedFramework("ReplayKit"),
                .linkedFramework("VideoToolbox"),
                .linkedFramework("AVKit"),
                .linkedFramework("GLKit"),
                .linkedFramework("AssetsLibrary"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("OpenGLES"),
                .linkedFramework("CoreMotion"),
                .linkedFramework("Accelerate"),
                .linkedFramework("MetalKit"),
                .linkedFramework("MobileCoreServices"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("MetalPerformanceShaders"),
                .linkedLibrary("sqlite3.0"),
                .linkedLibrary("c++"),
                .linkedLibrary("resolv")
            ]
        ),.target(
            name: "TXLiteAVSDK_ReplayKit",
            dependencies: [
                .target(name: "TXLiteAVSDK_ReplayKitExt")
            ],
            sources: ["TXLiteAVSDK_ReplayKitExt.swift"]
        )
    ]
)

