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
            url: "https://liteav.sdk.qcloud.com/download/spm/12.5/trtc/TXLiteAVSDK_TRTC.xcframework.zip",
            checksum: "8986a578e83e5fe8311ad2604ad1540dd018c38050d03c505f6f55bcb08d0c3d"
        ),
        .binaryTarget(
            name: "TXFFmpeg",
            url: "https://liteav.sdk.qcloud.com/download/spm/12.5/trtc/TXFFmpeg.xcframework.zip",
            checksum: "10274f7d95ec4007c69cc6d6793ecde907e974d78bbe71f982b5455089e6968c"
        ),
        .binaryTarget(
            name: "TXLiteAVSDK_ReplayKitExt",
            url: "https://liteav.sdk.qcloud.com/download/spm/12.5/professional/TXLiteAVSDK_ReplayKitExt.xcframework.zip",
            checksum: "221e8be5e0d90a9d7d5fece257b3f0a2e8f5a88e388c81548d0d4b0ed8addc89"
        ),
        .binaryTarget(
            name: "TXSoundTouch",
            url: "https://liteav.sdk.qcloud.com/download/spm/12.5/trtc/TXSoundTouch.xcframework.zip",
            checksum: "397de14af4d29784fd85bec23b8c2898c4fff1bb06c5848a16ecc0233a7c6808"
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

