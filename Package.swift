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
            url: "https://liteav.sdk.qcloud.com/download/spm/12.7/trtc/TXLiteAVSDK_TRTC.xcframework.zip",
            checksum: "8905c6dcaeb27f91d9bb3efb00428b418f1dc205c27736db4311e738f3b9a3fa"
        ),
        .binaryTarget(
            name: "TXFFmpeg",
            url: "https://liteav.sdk.qcloud.com/download/spm/12.7/trtc/TXFFmpeg.xcframework.zip",
            checksum: "e18c2d56cae99e57488b42bc52b22962d0565f7b74b2091ebaa38791a2f6aaaa"
        ),
        .binaryTarget(
            name: "TXLiteAVSDK_ReplayKitExt",
            url: "https://liteav.sdk.qcloud.com/download/spm/12.7/trtc/TXLiteAVSDK_ReplayKitExt.xcframework.zip",
            checksum: "da9915f459802bd7895634cf3e487df0d17e2768dc7ae786813e0239991e71af"
        ),
        .binaryTarget(
            name: "TXSoundTouch",
            url: "https://liteav.sdk.qcloud.com/download/spm/12.7/trtc/TXSoundTouch.xcframework.zip",
            checksum: "05137f34d747b34d2319f6b99dca82fd070832a397d4b89eba2440bc8dcd6c77"
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

