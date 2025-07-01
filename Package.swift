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
            url: "https://liteav.sdk.qcloud.com/download/spm/12.6/trtc/TXLiteAVSDK_TRTC.xcframework.zip",
            checksum: "f30f0ba9995fa8e062ee93bbbc716d38ffb0831779ad632814f572044fa6965b"
        ),
        .binaryTarget(
            name: "TXFFmpeg",
            url: "https://liteav.sdk.qcloud.com/download/spm/12.6/trtc/TXFFmpeg.xcframework.zip",
            checksum: "441c3775b8e108899ce6fdc17d520296c5a9214fbc55dd53aa03994aeb49e807"
        ),
        .binaryTarget(
            name: "TXLiteAVSDK_ReplayKitExt",
            url: "https://liteav.sdk.qcloud.com/download/spm/12.6/trtc/TXLiteAVSDK_ReplayKitExt.xcframework.zip",
            checksum: "a0fb3308516c8445557aa14b001de2a22e94d672380700c04cce49dd8e863ea4"
        ),
        .binaryTarget(
            name: "TXSoundTouch",
            url: "https://liteav.sdk.qcloud.com/download/spm/12.6/trtc/TXSoundTouch.xcframework.zip",
            checksum: "f32b92ec9bc3aab2a75238c94ab6058ef3cda20e7f56b382048a8228a7cc6553"
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

