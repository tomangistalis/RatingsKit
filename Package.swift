// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RatingsKit",
    defaultLocalization: "en",
    platforms: [.iOS(.v16), .macOS(.v13), .visionOS(.v1)],
    products: [
        .library(
            name: "RatingsKit",
            targets: ["RatingsKit"]),
    ],
    targets: [
        .target(
            name: "RatingsKit",
            resources: [
                .process("Media.xcassets")
            ]
        )
    ]
)
